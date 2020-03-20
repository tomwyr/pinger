import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/ping_service.dart';
import 'package:pinger/store/settings_store.dart';

part 'ping_store.g.dart';

@singleton
class PingStore extends PingStoreBase with _$PingStore {
  final PingService _pingService;
  final SettingsStore _settingsStore;

  PingStore(this._pingService, this._settingsStore);
}

abstract class PingStoreBase with Store {
  PingService get _pingService;
  SettingsStore get _settingsStore;

  PingSettings get _pingSettings => _settingsStore.userSettings.pingSettings;

  StreamSubscription _pingSub;

  @observable
  PingSession currentSession;

  @action
  void initSession(String host) {
    currentSession = PingSession(
      host: PingHost(name: host),
      status: PingStatus.initial,
    );
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
    _pingSub.cancel();
    currentSession = currentSession.copyWith(
      status: PingStatus.quickCheckDone,
      endTime: DateTime.now(),
    );
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
    _pingSub.cancel();
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
      _onSessionDone();
    }
  }

  void _startPing({int count, VoidCallback onDone}) {
    final settings =
        count != null ? _pingSettings.copyWith(count: count) : _pingSettings;
    _pingSub = _pingService
        .ping(currentSession.host.name, settings)
        .listen(_onPingResult, onDone: onDone);
  }

  void _onPingResult(double value) {
    final values = currentSession.values.toList()..add(value);
    currentSession = currentSession.copyWith(values: values);
  }

  void _onSessionDone() {
    currentSession = currentSession.copyWith(
      status: PingStatus.sessionDone,
      endTime: DateTime.now(),
    );
  }

  @action
  void stopSession() {
    _pingSub.cancel();
    currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
  }

  @action
  void restart() {
    initSession(currentSession.host.name);
  }
}
