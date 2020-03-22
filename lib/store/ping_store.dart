import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/store/archive_store.dart';
import 'package:pinger/store/settings_store.dart';

part 'ping_store.g.dart';

@singleton
class PingStore extends PingStoreBase with _$PingStore {
  final PingService _pingService;
  final SettingsStore _settingsStore;
  final ArchiveStore _archiveStore;

  PingStore(this._pingService, this._settingsStore, this._archiveStore);
}

abstract class PingStoreBase with Store {
  PingService get _pingService;
  SettingsStore get _settingsStore;
  ArchiveStore get _archiveStore;

  PingSettings get _pingSettings => _settingsStore.userSettings.pingSettings;

  StreamSubscription _pingSub;
  StreamSubscription _timerSub;
  Stopwatch _timer;

  @observable
  Duration pingDuration;

  @observable
  PingSession currentSession;

  @observable
  int _archivedId;

  @computed
  bool get isArchived => _archivedId != null;

  @action
  void initSession(String host) {
    currentSession = PingSession(
      host: PingHost(name: host),
      status: PingStatus.initial,
    );
    _timer = Stopwatch();
  }

  @action
  void startQuickCheck() {
    currentSession = PingSession(
      host: currentSession.host,
      status: PingStatus.quickCheckStarted,
      startTime: DateTime.now(),
    );
    _startPing(count: null);
  }

  @action
  void stopQuickCheck() {
    _stopPing();
    currentSession = currentSession.copyWith(status: PingStatus.quickCheckDone);
  }

  @action
  void startSession() {
    currentSession = PingSession(
      host: currentSession.host,
      status: PingStatus.sessionStarted,
      startTime: DateTime.now(),
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
    final remainingCount = _pingSettings.count - currentSession.values.length;
    if (remainingCount > 0) {
      currentSession =
          currentSession.copyWith(status: PingStatus.sessionStarted);
      _startPing(count: remainingCount, onDone: _onSessionDone);
    } else {
      currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
    }
  }

  void _startPing({int count, VoidCallback onDone}) {
    final settings =
        count != null ? _pingSettings.copyWith(count: count) : _pingSettings;
    _pingSub = _pingService
        .ping(currentSession.host.name, settings)
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
    _timer.stop();
    _timerSub.cancel();
    _pingSub.cancel();
  }

  @action
  void restart() => initSession(currentSession.host.name);

  @action
  Future<void> saveResult() async {
    final result = PingResult(
      host: currentSession.host,
      settings: _settingsStore.userSettings.pingSettings,
      startTime: currentSession.startTime,
      duration: _timer.elapsed,
      values: currentSession.values,
    );
    _archivedId = await _archiveStore.saveResult(result);
  }

  @action
  Future<void> deleteResult() async {
    await _archiveStore.deleteResult(_archivedId);
    _archivedId = null;
  }
}
