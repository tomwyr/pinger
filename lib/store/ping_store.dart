import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/store/device_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/results_store.dart';
import 'package:pinger/store/settings_store.dart';

part 'ping_store.g.dart';

@singleton
class PingStore extends PingStoreBase with _$PingStore {
  final PingerPrefs _pingerPrefs;
  final PingerApi _pingerApi;
  final PingService _pingService;
  final SettingsStore _settingsStore;
  final ResultsStore _resultsStore;
  final HostsStore _hostsStore;
  final DeviceStore _deviceStore;
  final PermissionStore _locationPermissionStore;

  PingStore(
    this._pingerPrefs,
    this._pingerApi,
    this._pingService,
    this._settingsStore,
    this._resultsStore,
    this._hostsStore,
    this._deviceStore,
    @Named(PermissionStore.location) this._locationPermissionStore,
  );
}

abstract class PingStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;
  PingService get _pingService;
  SettingsStore get _settingsStore;
  ResultsStore get _resultsStore;
  HostsStore get _hostsStore;
  DeviceStore get _deviceStore;
  PermissionStore get _locationPermissionStore;

  StreamSubscription? _pingSub;
  StreamSubscription? _timerSub;
  Stopwatch? _timer;
  PingSettings? _sessionLastSettings;
  bool _didShareResult = false;

  @observable
  Duration? pingDuration;

  @observable
  PingSession? currentSession;

  @observable
  PingSession? prevSession;

  @observable
  PingStatus? prevStatus;

  @observable
  int? _archivedId;

  @computed
  bool get canArchiveResult =>
      _archivedId == null && currentSession!.stats != null;

  @computed
  bool get didChangeSettings =>
      currentSession!.settings != _settingsStore.userSettings!.pingSettings &&
      !currentSession!.status.isQuickCheck;

  @computed
  String? get currentHost => currentSession?.host;

  @action
  void init() {
    final host = _pingerPrefs.getLastHost();
    if (host != null) initSession(host);
    reaction<String?>((_) => currentHost, _cacheCurrentHost);
    reaction<PingStatus?>((_) => currentSession?.status, _handleStatusChange);
    reaction<PingSession?>(
      (_) => currentSession,
      _deviceStore.updateNotification,
    );
  }

  void _cacheCurrentHost(String? host) async {
    if (!_settingsStore.userSettings!.restoreHost) host = null;
    if (_pingerPrefs.getLastHost() != host) {
      await _pingerPrefs.setLastHost(host!);
    }
  }

  void _handleStatusChange(PingStatus? status) {
    if (prevStatus.isInitial && status.isStarted) {
      _hostsStore.incrementStats(currentSession!.host);
    }
    if (status.isQuickCheckStarted) _deviceStore.triggerFeedback();
    prevStatus = status;
  }

  @action
  void initSession(String host) {
    _stopPing();
    _didShareResult = false;
    prevSession = currentSession;
    currentSession = PingSession(
      host: host,
      status: PingStatus.initial,
      settings: _getInitSessionSettings()!,
    );
    pingDuration = Duration.zero;
    _archivedId = null;
    _timer = Stopwatch();
  }

  PingSettings? _getInitSessionSettings() {
    PingSettings? settings;
    if (_sessionLastSettings != null) {
      settings = _sessionLastSettings;
      _sessionLastSettings = null;
    } else if (currentSession != null) {
      settings = currentSession!.settings;
    } else {
      settings = _settingsStore.userSettings!.pingSettings;
    }
    return settings;
  }

  @action
  void updateSettings(PingSettings settings) {
    currentSession = currentSession!.copyWith(settings: settings);
  }

  @action
  void clearSettings() {
    updateSettings(_settingsStore.userSettings!.pingSettings);
  }

  @action
  void startQuickCheck() {
    _timer!.reset();
    _sessionLastSettings = currentSession!.settings;
    currentSession = currentSession!.copyWith(
      settings: currentSession!.settings.copyWith(count: NumSetting.infinite()),
      status: PingStatus.quickCheckStarted,
      startTime: DateTime.now(),
      values: [],
    );
    _startPing();
  }

  @action
  void lockQuickCheck() {
    currentSession = currentSession!.copyWith(
      status: PingStatus.quickCheckLocked,
    );
  }

  @action
  void unlockQuickCheck() {
    currentSession = currentSession!.copyWith(
      status: PingStatus.quickCheckStarted,
    );
  }

  @action
  void stopQuickCheck() {
    _stopPing();
    _shareResultIfPossible(currentSession!);
    initSession(currentSession!.host);
  }

  @action
  void startSession() {
    _timer!.reset();
    currentSession = currentSession!.copyWith(
      status: PingStatus.sessionStarted,
      startTime: DateTime.now(),
      values: [],
    );
    _startPing(onDone: _onSessionDone);
  }

  @action
  void pauseSession() {
    _stopPing();
    currentSession = currentSession!.copyWith(status: PingStatus.sessionPaused);
  }

  @action
  void resumeSession() {
    final remainingCount = currentSession!.settings.count.when(
      finite: (it) => NumSetting.finite(
        value: it - currentSession!.values!.length,
      ),
      infinite: () => NumSetting.infinite(),
    );
    final isDone = remainingCount.when(
      finite: (it) => it == 0,
      infinite: () => false,
    );
    if (!isDone) {
      currentSession =
          currentSession!.copyWith(status: PingStatus.sessionStarted);
      final PingSettings? settings =
          currentSession!.settings.copyWith(count: remainingCount);
      _startPing(settings: settings, onDone: _onSessionDone);
    } else {
      currentSession = currentSession!.copyWith(status: PingStatus.sessionDone);
    }
  }

  void _startPing({PingSettings? settings, VoidCallback? onDone}) {
    _pingSub = _pingService
        .ping(currentSession!.host, settings ?? currentSession!.settings)
        .listen(_onPingResult, onDone: onDone, onError: _onPingError);
    _timer!.start();
    _timerSub = Stream.periodic(Duration(seconds: 1))
        .listen((it) => pingDuration = _timer!.elapsed);
  }

  void _onPingError(error, StackTrace stackTrace) async {
    if (error is PingError) {
      _onPingResult(null);
    } else {
      await Future.error(error, stackTrace);
    }
  }

  void _onPingResult(double? value) {
    final values = currentSession!.values!.toList()..add(value?.round());
    currentSession = currentSession!.copyWith(values: values as List<int>?);
  }

  void _onSessionDone() {
    _timer!.stop();
    _timerSub!.cancel();
    _shareResultIfPossible(currentSession!);
    currentSession = currentSession!.copyWith(status: PingStatus.sessionDone);
  }

  void _shareResultIfPossible(PingSession session) async {
    if (_shouldShareResult(session)) {
      _didShareResult = true;
      final result = GlobalSessionResult(
        count: currentSession!.values!.length,
        host: currentSession!.host,
        stats: currentSession!.stats!,
        location: await _getResultLocation(),
      );
      try {
        await _pingerApi.saveSessionResult(result);
      } on ApiError {}
    }
  }

  bool _shouldShareResult(PingSession session) {
    final isSessionShareable =
        session.values!.length >= 10 && session.stats != null;
    final isSharingEnabled =
        _settingsStore.userSettings!.shareSettings.shareResults;
    return isSessionShareable && isSharingEnabled && !_didShareResult;
  }

  Future<GeoPosition?> _getResultLocation() async {
    final attachLocation =
        _settingsStore.userSettings!.shareSettings.attachLocation;
    return attachLocation && _locationPermissionStore.canAccessService
        ? await _deviceStore.getCurrentPosition()
        : null;
  }

  @action
  void stopSession() {
    _stopPing();
    currentSession = currentSession!.copyWith(status: PingStatus.sessionDone);
  }

  void _stopPing() {
    _timer?.stop();
    _timerSub?.cancel();
    _pingSub?.cancel();
  }

  @action
  void restartSession() => initSession(currentSession!.host);

  @action
  Future<void> archiveResult() async {
    final result = PingResult(
      host: currentSession!.host,
      settings: currentSession!.settings,
      startTime: currentSession!.startTime!,
      values: currentSession!.values!,
      stats: currentSession!.stats!,
      duration: _timer!.elapsed,
    );
    _archivedId = await _resultsStore.saveLocalResult(result);
  }
}
