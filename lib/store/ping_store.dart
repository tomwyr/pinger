import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/service/favicon_service.dart';

part 'ping_store.g.dart';

@singleton
class PingStore = PingStoreBase with _$PingStore;

abstract class PingStoreBase with Store {
  @observable
  Ping currentPing;

  @action
  void start(String host) {
    currentPing = Ping(
      host: PingHost(name: host),
      avatar: FaviconService(urlWrapper: FaviconService.google).load(host),
    );
  }
}

class Ping {
  final PingHost host;
  final Future<Uint8List> avatar;

  Ping({@required this.host, @required this.avatar});
}
