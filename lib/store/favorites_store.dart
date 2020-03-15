import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

@singleton
class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  @observable
  List<String> items = [];

  @action
  void toggleFavorite(String host) {
    final favs = items.toList();
    favs.contains(host) ? favs.remove(host) : favs.add(host);
    items = favs;
  }
}
