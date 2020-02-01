import 'package:mobx/mobx.dart';

part 'ping_store.g.dart';

class PingStore extends PingStoreBase with _$PingStore {
  static PingStore _instance;

  PingStore._();
  factory PingStore() => _instance ??= PingStore._();
}

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
