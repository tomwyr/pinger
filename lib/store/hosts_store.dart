import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/service/favicon_service.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/utils/data_snap.dart';

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
  DataSnap<List<HostItem>> hosts;

  @observable
  Map<String, HostStats> stats;

  @computed
  List<HostItem> get searchResults {
    return hosts.maybeWhen(
      data: (data) => _searchQuery.isEmpty
          ? data.toList()
          : data.where((it) => it.name.contains(_searchQuery)).toList(),
      orElse: () => null,
    );
  }

  @action
  Future<void> init() async {
    _emitStats();
    await fetchHosts();
  }

  @action
  Future<void> fetchHosts() async {
    hosts = DataSnap.loading();
    try {
      final counts = await _pingerApi.getPingCounts();
      final maxCount = counts.pingCounts.map((it) => it.count).reduce(max);
      final hostsList = counts.pingCounts
          .map((it) => HostItem(it.host, it.count / maxCount))
          .toList()
            ..sort((e1, e2) => e2.popularity.compareTo(e1.popularity));
      hosts = DataSnap.data(hostsList);
    } on ApiError {
      hosts = DataSnap.error();
    }
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
