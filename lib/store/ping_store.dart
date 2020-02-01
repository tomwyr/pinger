import 'package:mobx/mobx.dart';

part 'ping_store.g.dart';

class PingStore = PingStoreBase with _$PingStore;

abstract class PingStoreBase with Store {
  @observable
  Ping currentPing;

  @action
  void start(String host) {
    currentPing = Ping(host);
  }
}

class Ping {
  final String host;

  Ping(this.host);
}
