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
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/settings_store.dart';

part 'ping_store.g.dart';

@singleton
class PingStore extends PingStoreBase with _$PingStore {
  final PingerPrefs _pingerPrefs;
  final PingerApi _pingerApi;
  final PingService _pingService;
  final SettingsStore _settingsStore;
  final ArchiveStore _archiveStore;
  final HostsStore _hostsStore;
  final LocationStore _locationStore;

  PingStore(
    this._pingerPrefs,
    this._pingerApi,
    this._pingService,
    this._settingsStore,
    this._archiveStore,
    this._hostsStore,
    this._locationStore,
  );
}

abstract class PingStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;
  PingService get _pingService;
  SettingsStore get _settingsStore;
  ArchiveStore get _archiveStore;
  HostsStore get _hostsStore;
  LocationStore get _locationStore;

  StreamSubscription _pingSub;
  StreamSubscription _timerSub;
  Stopwatch _timer;
  PingStatus _lastStatus;
  bool _didShareResult = false;

  @observable
  bool didInit = false;

  @observable
  Duration pingDuration;

  @observable
  PingSession currentSession;

  @observable
  PingStatus prevStatus;

  @observable
  int _archivedId;

  @computed
  bool get canArchiveResult =>
      _archivedId == null && currentSession.stats != null;

  @computed
  bool get didChangeSettings =>
      currentSession.settings != _settingsStore.userSettings.pingSettings;

  @action
  void init() {
    final host = _pingerPrefs.getLastHost();
    if (host != null) initSession(host);
    autorun((_) {
      if (currentSession != null) {
        _cacheCurrentHost();
        _handleStatusChange();
        _shareResultIfPossible();
      }
    });
    didInit = true;
  }

  void _cacheCurrentHost() async {
    final host =
        _settingsStore.userSettings.restoreHost ? currentSession?.host : null;
    await _pingerPrefs.setLastHost(host);
  }

  void _handleStatusChange() {
    final status = currentSession.status;
    if (_lastStatus != status) prevStatus = _lastStatus;
    if (_lastStatus.isInitial && status.isStarted) {
      _hostsStore.incrementStats(currentSession.host);
    }
    _lastStatus = status;
  }

  void _shareResultIfPossible() async {
    if (_shouldShareResult()) {
      final result = GlobalSessionResult(
        count: currentSession.values.length,
        host: currentSession.host,
        stats: currentSession.stats,
        location: await _getResultLocation(),
      );
      _didShareResult = true;
      try {
        await _pingerApi.saveSessionResult(result);
      } on ApiError {}
    }
  }

  bool _shouldShareResult() {
    final isSessionShareable = currentSession.status.isDone &&
        currentSession.values.length >= 10 &&
        currentSession.stats != null;
    final isSharingEnabled =
        _settingsStore.userSettings.shareSettings.shareResults;
    return isSessionShareable && isSharingEnabled && !_didShareResult;
  }

  Future<GeoPosition> _getResultLocation() async {
    final attachLocation =
        _settingsStore.userSettings.shareSettings.attachLocation;
    return attachLocation && _locationStore.hasPermission
        ? await _locationStore.getCurrentPosition()
        : null;
  }

  @action
  void initSession(String host) {
    _stopPing();
    currentSession = PingSession(
      host: host,
      status: PingStatus.initial,
      settings:
          currentSession?.settings ?? _settingsStore.userSettings.pingSettings,
    );
    pingDuration = Duration.zero;
    _archivedId = null;
    _timer = Stopwatch();
  }

  @action
  void updateSettings(PingSettings settings) {
    currentSession = currentSession.copyWith(settings: settings);
  }

  @action
  void clearSettings() {
    updateSettings(_settingsStore.userSettings.pingSettings);
  }

  @action
  void startQuickCheck() {
    _timer.reset();
    currentSession = currentSession.copyWith(
      status: PingStatus.quickCheckStarted,
      startTime: DateTime.now(),
      values: [],
    );
    _startPing(settings: currentSession.settings.copyWith(count: null));
  }

  @action
  void stopQuickCheck() {
    _stopPing();
    currentSession = currentSession.copyWith(status: PingStatus.quickCheckDone);
  }

  @action
  void startSession() {
    _timer.reset();
    currentSession = currentSession.copyWith(
      status: PingStatus.sessionStarted,
      startTime: DateTime.now(),
      values: [],
    );
    _startPing(onDone: _onSessionDone);
  }

  @action
  void pauseSession() {
    _stopPing();
    currentSession = currentSession.copyWith(status: PingStatus.sessionPaused);
  }

  @action
  void resumeSession() {
    final remainingCount =
        currentSession.settings.count - currentSession.values.length;
    if (remainingCount > 0) {
      currentSession =
          currentSession.copyWith(status: PingStatus.sessionStarted);
      final settings = currentSession.settings.copyWith(count: remainingCount);
      _startPing(settings: settings, onDone: _onSessionDone);
    } else {
      currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
    }
  }

  void _startPing({PingSettings settings, VoidCallback onDone}) {
    _pingSub = _pingService
        .ping(currentSession.host, settings ?? currentSession.settings)
        .listen(_onPingResult, onDone: onDone, onError: _onPingError);
    _timer.start();
    _timerSub = Stream.periodic(Duration(seconds: 1))
        .listen((it) => pingDuration = _timer.elapsed);
  }

  void _onPingError(error, StackTrace stackTrace) async {
    if (error is PingError) {
      _onPingResult(null);
    } else {
      await Future.error(error, stackTrace);
    }
  }

  void _onPingResult(double value) {
    final values = currentSession.values.toList()..add(value?.round());
    currentSession = currentSession.copyWith(values: values);
  }

  void _onSessionDone() {
    _timer.stop();
    _timerSub.cancel();
    currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
  }

  void _stopPing() {
    _timer?.stop();
    _timerSub?.cancel();
    _pingSub?.cancel();
  }

  @action
  void restartSession() => initSession(currentSession.host);

  @action
  Future<void> archiveResult() async {
    final result = PingResult(
      host: currentSession.host,
      settings: currentSession.settings,
      startTime: currentSession.startTime,
      values: currentSession.values,
      stats: currentSession.stats,
      duration: _timer.elapsed,
    );
    _archivedId = await _archiveStore.saveLocalResult(result);
  }
}
