// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on LocationStoreBase, Store {
  final _$hasPermissionAtom = Atom(name: 'LocationStoreBase.hasPermission');

  @override
  bool get hasPermission {
    _$hasPermissionAtom.context.enforceReadPolicy(_$hasPermissionAtom);
    _$hasPermissionAtom.reportObserved();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.context.conditionallyRunInAction(() {
      super.hasPermission = value;
      _$hasPermissionAtom.reportChanged();
    }, _$hasPermissionAtom, name: '${_$hasPermissionAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$requestPermissionAsyncAction = AsyncAction('requestPermission');

  @override
  Future<void> requestPermission() {
    return _$requestPermissionAsyncAction.run(() => super.requestPermission());
  }

  final _$getCurrentPositionAsyncAction = AsyncAction('getCurrentPosition');

  @override
  Future<GeoPosition> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  @override
  String toString() {
    final string = 'hasPermission: ${hasPermission.toString()}';
    return '{$string}';
  }
}
