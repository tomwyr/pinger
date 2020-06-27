// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on FavoritesStoreBase, Store {
  final _$itemsAtom = Atom(name: 'FavoritesStoreBase.items');

  @override
  List<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$addFavoriteAsyncAction =
      AsyncAction('FavoritesStoreBase.addFavorite');

  @override
  Future<void> addFavorite(String host) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(host));
  }

  final _$removeFavoritesAsyncAction =
      AsyncAction('FavoritesStoreBase.removeFavorites');

  @override
  Future<void> removeFavorites(List<String> hosts) {
    return _$removeFavoritesAsyncAction.run(() => super.removeFavorites(hosts));
  }

  final _$FavoritesStoreBaseActionController =
      ActionController(name: 'FavoritesStoreBase');

  @override
  void init() {
    final _$actionInfo = _$FavoritesStoreBaseActionController.startAction(
        name: 'FavoritesStoreBase.init');
    try {
      return super.init();
    } finally {
      _$FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
