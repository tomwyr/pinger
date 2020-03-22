import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'favorites_store.g.dart';

@singleton
class FavoritesStore extends FavoritesStoreBase with _$FavoritesStore {
  final PingerPrefs _pingerPrefs;

  FavoritesStore(this._pingerPrefs);
}

abstract class FavoritesStoreBase with Store {
  PingerPrefs get _pingerPrefs;

  @observable
  List<String> items;

  @action
  void init() {
    items = _pingerPrefs.getFavoriteHosts();
  }

  @action
  Future<void> addFavorite(String host) async {
    await _pingerPrefs.addFavoriteHost(host);
    items = items.toList()..add(host);
  }

  @action
  Future<void> removeFavorite(String host) async {
    await _pingerPrefs.removeFavoriteHost(host);
    items = items.toList()..remove(host);
  }

  bool isFavorite(String host) => items.any((it) => it == host);
}
