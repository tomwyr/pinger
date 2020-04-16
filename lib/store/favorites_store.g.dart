// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesStore on FavoritesStoreBase, Store {
  final _$itemsAtom = Atom(name: 'FavoritesStoreBase.items');

  @override
  List<String> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(List<String> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }

  final _$addFavoriteAsyncAction = AsyncAction('addFavorite');

  @override
  Future<void> addFavorite(String host) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(host));
  }

  final _$removeFavoriteAsyncAction = AsyncAction('removeFavorite');

  @override
  Future<void> removeFavorite(String host) {
    return _$removeFavoriteAsyncAction.run(() => super.removeFavorite(host));
  }

  final _$FavoritesStoreBaseActionController =
      ActionController(name: 'FavoritesStoreBase');

  @override
  void init() {
    final _$actionInfo = _$FavoritesStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$FavoritesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'items: ${items.toString()}';
    return '{$string}';
  }
}