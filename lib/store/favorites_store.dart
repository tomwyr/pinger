import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

@singleton
class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  @observable
  List<String> items = [];

  @action
  void addFavorite(String host) {
    items = items..add(host);
  }

  @action
  void removeFavorite(String host) {
    items = items..remove(host);
  }
}
