import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/model/ping_global.dart';
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
  final Connectivity _connectivity;

  HostsStore(
    this._pingerPrefs,
    this._pingerApi,
    this._faviconService,
    this._connectivity,
  );
}

abstract class HostsStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;
  FaviconService get _faviconService;
  Connectivity get _connectivity;

  final Map<String, Observable<DataSnap<Uint8List>>> _favicons = {};

  ConnectivityResult _lastConnectivity;

  @observable
  String _searchQuery = "";

  @observable
  DataSnap<List<HostItem>> hosts;

  @observable
  Map<String, HostStats> localStats;

  @observable
  List<String> favorites;

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
    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    _emitStats();
    autorun((_) => _emitFavorites());
    await fetchHosts();
  }

  void _onConnectivityChanged(ConnectivityResult result) {
    if (result != _lastConnectivity) {
      _lastConnectivity = result;
      final isEnabled = result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi;
      if (isEnabled) {
        _favicons.forEach((key, value) {
          if (value.value is SnapError) _tryLoadFavicon(key);
        });
      }
    }
  }

  void _emitStats() {
    localStats = {for (var it in _pingerPrefs.getHostsStats()) it.host: it};
  }

  void _emitFavorites() {
    final favoriteHosts = _pingerPrefs.getFavoriteHosts();
    favorites = favoriteHosts
      ..sort((e1, e2) {
        if (!localStats.containsKey(e1)) return 1;
        if (!localStats.containsKey(e2)) return -1;
        return localStats[e2].pingCount.compareTo(localStats[e1].pingCount);
      });
  }

  @action
  Future<void> fetchHosts() async {
    hosts = DataSnap.loading();
    try {
      final counts = await _pingerApi.getPingCounts();
      hosts = DataSnap.data(_createHostItems(counts));
    } on ApiError {
      hosts = DataSnap.error();
    }
  }

  List<HostItem> _createHostItems(GlobalPingCounts counts) {
    if (counts.totalCount == 0) {
      return counts.pingCounts.map((it) => HostItem(it.host, 0.5)).toList();
    } else {
      final maxCount = counts.pingCounts.map((it) => it.count).reduce(max);
      return counts.pingCounts
          .map((it) => HostItem(it.host, it.count / maxCount))
          .toList()
            ..sort((e1, e2) => e2.popularity.compareTo(e1.popularity));
    }
  }

  @action
  Future<void> addFavorite(String host) async {
    await _pingerPrefs.addFavoriteHost(host);
    _emitFavorites();
  }

  @action
  Future<void> removeFavorites(List<String> hosts) async {
    await _pingerPrefs.removeFavoriteHosts(hosts);
    _emitFavorites();
  }

  @action
  Future<void> incrementStats(String host) async {
    final hostsStats = localStats.values.toList();
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

  @action
  void search(String query) => _searchQuery = query;

  Observable<DataSnap<Uint8List>> getFavicon(String host) {
    var favicon = _favicons[host];
    if (favicon == null) {
      favicon = Observable(null);
      _favicons[host] = favicon;
      _tryLoadFavicon(host);
    } else if (favicon.value is SnapError) {
      _tryLoadFavicon(host);
    }
    return favicon;
  }

  @action
  Future<void> _tryLoadFavicon(String host) async {
    final observable = _favicons[host];
    observable.value = DataSnap.loading();
    try {
      final icon = await _faviconService.load(host);
      observable.value = DataSnap.data(icon);
    } on FaviconError {
      observable.value = DataSnap.error();
    }
  }
}

class HostItem {
  final String name;
  final double popularity;

  HostItem(this.name, this.popularity);
}
