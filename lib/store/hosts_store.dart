import 'dart:async';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'hosts_store.g.dart';

@singleton
class HostsStore extends HostsStoreBase with _$HostsStore {
  final PingerPrefs _pingerPrefs;

  HostsStore(this._pingerPrefs);
}

abstract class HostsStoreBase with Store {
  PingerPrefs get _pingerPrefs;

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
  List<HostStats> stats;

  @observable
  List<HostItem> hosts;

  @observable
  bool isLoading = false;

  StreamSubscription _lastSearch;

  @action
  void init() {
    stats = _pingerPrefs.getHostsStats();
  }

  @action
  Future<void> incrementStats(String host) async {
    final hostsStats = stats.toList();
    final index = hostsStats.indexWhere((it) => it.host == host);
    final updatedStats = index != -1
        ? hostsStats[index].copyWith(
            pingCount: hostsStats[index].pingCount + 1,
            pingTime: DateTime.now(),
          )
        : HostStats(host: host, pingCount: 1, pingTime: DateTime.now());
    if (index != -1) hostsStats.removeAt(index);
    hostsStats.add(updatedStats);
    await _pingerPrefs.saveHostsStats(hostsStats);
    stats = hostsStats;
  }

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
