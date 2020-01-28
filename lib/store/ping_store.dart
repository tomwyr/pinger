import 'package:mobx/mobx.dart';

part 'ping_store.g.dart';

class PingStore = PingStoreBase with _$PingStore;

abstract class PingStoreBase with Store {
  @observable
  Ping value = Ping('netflix.com');
}

class Ping {
  final String host;

  Ping(this.host);
}
