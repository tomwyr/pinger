import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/hosts_store.dart';
import 'package:pinger/store/settings_store.dart';

part 'ping_store.g.dart';

@singleton
class PingStore extends PingStoreBase with _$PingStore {
  final PingService _pingService;
  final SettingsStore _settingsStore;
  final ArchiveStore _archiveStore;
  final HostsStore _hostsStore;

  PingStore(
    this._pingService,
    this._settingsStore,
    this._archiveStore,
    this._hostsStore,
  );
}

abstract class PingStoreBase with Store {
  PingService get _pingService;
  SettingsStore get _settingsStore;
  ArchiveStore get _archiveStore;
  HostsStore get _hostsStore;

  StreamSubscription _pingSub;
  StreamSubscription _timerSub;
  Stopwatch _timer;
  PingStatus _lastStatus;

  @observable
  Duration pingDuration;

  @observable
  PingSession currentSession;

  @observable
  int _archivedId;

  @computed
  bool get isArchived => _archivedId != null;

  @action
  void init() {
    autorun((_) => _updateStatsIfDidStart());
  }

  void _updateStatsIfDidStart() {
    final status = currentSession.status;
    if (_lastStatus == PingStatus.initial &&
        (status == PingStatus.sessionStarted ||
            status == PingStatus.quickCheckStarted)) {
      _hostsStore.incrementStats(currentSession.host.name);
    }
    _lastStatus = status;
  }

  @action
  void initSession(String host) {
    _stopPing();
    currentSession = PingSession(
      host: PingHost(name: host),
      status: PingStatus.initial,
      settings: _settingsStore.userSettings.pingSettings,
    );
    pingDuration = Duration.zero;
    _archivedId = null;
    _timer = Stopwatch();
  }

  @action
  void startQuickCheck() {
    _timer.reset();
    currentSession = currentSession.copyWith(
      status: PingStatus.quickCheckStarted,
      startTime: DateTime.now(),
      values: [],
    );
    _startPing();
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
        .ping(currentSession.host.name, settings ?? currentSession.settings)
        .listen(_onPingResult, onDone: onDone);
    _timer.start();
    _timerSub = Stream.periodic(Duration(seconds: 1))
        .listen((it) => pingDuration = _timer.elapsed);
  }

  void _onPingResult(double value) {
    final values = currentSession.values.toList()..add(value);
    currentSession = currentSession.copyWith(values: values);
  }

  void _onSessionDone() {
    _timer.stop();
    _timerSub.cancel();
    currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
  }

  @action
  void stopSession() {
    _stopPing();
    currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
  }

  void _stopPing() {
    _timer?.stop();
    _timerSub?.cancel();
    _pingSub?.cancel();
  }

  @action
  void restart() => initSession(currentSession.host.name);

  @action
  Future<void> saveResult() async {
    final result = PingResult(
      host: currentSession.host,
      settings: currentSession.settings,
      startTime: currentSession.startTime,
      values: currentSession.values,
      stats: currentSession.stats,
      duration: _timer.elapsed,
    );
    _archivedId = await _archiveStore.saveResult(result);
  }

  @action
  Future<void> deleteResult() async {
    await _archiveStore.deleteResult(_archivedId);
    _archivedId = null;
  }
}
