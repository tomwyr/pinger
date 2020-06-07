import 'dart:async';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/service/favicon_service.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'hosts_store.g.dart';

@singleton
class HostsStore extends HostsStoreBase with _$HostsStore {
  final PingerPrefs _pingerPrefs;
  final PingerApi _pingerApi;
  final FaviconService _faviconService;

  HostsStore(this._pingerPrefs, this._pingerApi, this._faviconService);
}

abstract class HostsStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;
  FaviconService get _faviconService;

  @observable
  String _searchQuery = "";

  @observable
  List<HostItem> hosts = [];

  @observable
  Map<String, HostStats> stats;

  @observable
  bool isLoading = false;

  @computed
  List<HostItem> get searchResults {
    if (hosts == null) return null;
    return _searchQuery.isEmpty
        ? hosts.toList()
        : hosts.where((it) => it.name.contains(_searchQuery)).toList();
  }

  @action
  Future<void> init() async {
    isLoading = true;
    _emitStats();
    hosts = await _fetchSearchItems();
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
    final hostsStats = stats.values.toList();
    final index = hostsStats.indexWhere((it) => it.host == host);
    final updatedStats = HostStats(
      host: host,
      pingTime: DateTime.now(),
      pingCount: (index == -1 ? 0 : hostsStats[index].pingCount) + 1,
    );
    if (index != -1) hostsStats.removeAt(index);
    hostsStats.insert(0, updatedStats);
    await _pingerPrefs.saveHostsStats(hostsStats);
    _emitStats();
  }

  @action
  Future<void> removeStats(List<String> hosts) async {
    await _pingerPrefs.removeHostsStats(hosts);
    _emitStats();
  }

  void _emitStats() {
    stats = {for (var it in _pingerPrefs.getHostsStats()) it.host: it};
  }

  @action
  void search(String query) => _searchQuery = query;

  Favicon getFavicon(String url) => Favicon(_faviconService.load(url));
}

class HostItem {
  final String name;
  final double popularity;

  HostItem(this.name, this.popularity);
}

class Favicon {
  final Future<Uint8List> data;

  Favicon(this.data);
}
