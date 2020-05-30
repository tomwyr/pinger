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
    _$hasPermissionAtom.reportRead();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.reportWrite(value, super.hasPermission, () {
      super.hasPermission = value;
    });
  }

  final _$initAsyncAction = AsyncAction('LocationStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_requestPermissionIfGotEnabledAsyncAction =
      AsyncAction('LocationStoreBase._requestPermissionIfGotEnabled');

  @override
  Future<void> _requestPermissionIfGotEnabled() {
    return _$_requestPermissionIfGotEnabledAsyncAction
        .run(() => super._requestPermissionIfGotEnabled());
  }

  final _$getCurrentPositionAsyncAction =
      AsyncAction('LocationStoreBase.getCurrentPosition');

  @override
  Future<GeoPosition> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  @override
  String toString() {
    return '''
hasPermission: ${hasPermission}
    ''';
  }
}
