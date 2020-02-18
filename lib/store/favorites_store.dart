import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

@singleton
class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  @observable
  List<FavoriteItem> items = [];
}

class FavoriteItem {
  final String host;
  final int pingCount;

  FavoriteItem(this.host, this.pingCount);
}
