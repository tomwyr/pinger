import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'hosts_store.g.dart';

@singleton
class HostsStore extends HostsStoreBase with _$HostsStore {
  final PingerPrefs _pingerPrefs;
  final PingerApi _pingerApi;

  HostsStore(this._pingerPrefs, this._pingerApi);
}

abstract class HostsStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;

  @observable
  String _searchQuery = "";

  @observable
  List<HostItem> _hostItems;

  @observable
  List<HostStats> stats;

  @observable
  bool isLoading = false;

  @computed
  List<HostItem> get searchResults {
    if (_hostItems == null) return null;
    return _searchQuery.isEmpty
        ? _hostItems.toList()
        : _hostItems.where((it) => it.name.contains(_searchQuery)).toList();
  }

  @action
  Future<void> init() async {
    isLoading = true;
    stats = _pingerPrefs.getHostsStats();
    _hostItems = await _fetchSearchItems();
    isLoading = false;
  }

  Future<List<HostItem>> _fetchSearchItems() async {
    final counts = await _pingerApi.getPingCounts();
    return counts.pingCounts
        .map((it) => HostItem(it.host, it.count / counts.totalCount))
        .toList()
          ..sort((e1, e2) => e2.popularity.compareTo(e1.popularity));
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
  void search(String query) => _searchQuery = query;
}

class HostItem {
  final String name;
  final double popularity;

  HostItem(this.name, this.popularity);
}
