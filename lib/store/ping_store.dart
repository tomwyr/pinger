import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';
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

  @observable
  PingSession currentSession;

  @action
  void initSession(String host) {
    currentSession = PingSession(
      host: PingHost(name: host),
      status: PingStatus.initial,
    );
  }

  StreamSubscription _pingSub;

  @action
  void startQuickCheck() {
    final settings =
        _settingsStore.userSettings.pingSettings.copyWith(count: null);
    _pingSub = _pingService
        .ping(currentSession.host.name, settings)
        .listen(_onPingResult);
    currentSession = PingSession(
      host: currentSession.host,
      status: PingStatus.quickCheckStarted,
      startTime: DateTime.now(),
    );
  }

  @action
  void _onPingResult(double value) {
    final values = currentSession.values.toList()..add(value);
    currentSession = currentSession.copyWith(values: values);
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
  }

  @action
  void pauseSession() {
    currentSession = currentSession.copyWith(status: PingStatus.sessionPaused);
  }

  @action
  void resumeSession() {
    currentSession = currentSession.copyWith(status: PingStatus.sessionStarted);
  }

  @action
  void stopSession() {
    currentSession = currentSession.copyWith(status: PingStatus.sessionDone);
  }

  @action
  void restart() {
    currentSession = currentSession.copyWith(status: PingStatus.initial);
  }
}
