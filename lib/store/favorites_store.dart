import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/service/pinger_prefs.dart';
import 'package:pinger/store/hosts_store.dart';

part 'favorites_store.g.dart';

@singleton
class FavoritesStore extends FavoritesStoreBase with _$FavoritesStore {
  final PingerPrefs _pingerPrefs;
  final HostsStore _hostsStore;

  FavoritesStore(this._pingerPrefs, this._hostsStore);
}

abstract class FavoritesStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  HostsStore get _hostsStore;

  @observable
  List<String> items;

  @action
  void init() {
    autorun((_) => _emitFavorites());
  }

  void _emitFavorites() {
    final stats = _hostsStore.stats;
    final favorites = _pingerPrefs.getFavoriteHosts();
    items = favorites
      ..sort((e1, e2) {
        if (!stats.containsKey(e1)) return 1;
        if (!stats.containsKey(e2)) return -1;
        return stats[e2].pingCount.compareTo(stats[e1].pingCount);
      });
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

  bool isFavorite(String host) => items.any((it) => it == host);
}
