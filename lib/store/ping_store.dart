import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/ping_session.dart';

part 'ping_store.g.dart';

@singleton
class PingStore = PingStoreBase with _$PingStore;

abstract class PingStoreBase with Store {
  @observable
  PingSession currentSession;

  @action
  void initSession(String host) {
    currentSession = PingSession(
      host: PingHost(name: host),
      status: PingStatus.initial,
      values: [],
      startTime: null,
    );
  }
}
