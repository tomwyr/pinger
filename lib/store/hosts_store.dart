import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';

part 'hosts_store.g.dart';

class HostsStore = HostsStoreBase with _$HostsStore;

abstract class HostsStoreBase with Store {
  final List<HostItem> _fakeHosts = [
    HostItem("youtube.com", Random().nextDouble()),
    HostItem("google.com", Random().nextDouble()),
    HostItem("reddit.com", Random().nextDouble()),
    HostItem("twitch.tv", Random().nextDouble()),
    HostItem("facebook.com", Random().nextDouble()),
    HostItem("netflix.com", Random().nextDouble()),
    HostItem("twitter.com", Random().nextDouble()),
    HostItem("gmail.com", Random().nextDouble()),
    HostItem("wikipedia.org", Random().nextDouble()),
    HostItem("flutter.dev", Random().nextDouble()),
  ]..sort((h1, h2) => h2.popularity.compareTo(h1.popularity));

  @observable
  List<HostItem> hosts;

  @observable
  bool isLoading = false;

  StreamSubscription _lastSearch;

  @action
  Future<void> search(String query) async {
    _lastSearch?.cancel();
    isLoading = true;
    _lastSearch = Future.delayed(Duration(seconds: 1)).asStream().listen((_) {
      hosts = _fakeHosts.where((it) => it.name.contains(query)).toList();
      isLoading = false;
    });
  }
}

class HostItem {
  final String name;
  final double popularity;

  HostItem(this.name, this.popularity);
}
