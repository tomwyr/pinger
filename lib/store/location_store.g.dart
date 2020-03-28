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

  final _$_requestPermissionIfGotEnabledAsyncAction =
      AsyncAction('_requestPermissionIfGotEnabled');

  @override
  Future<void> _requestPermissionIfGotEnabled() {
    return _$_requestPermissionIfGotEnabledAsyncAction
        .run(() => super._requestPermissionIfGotEnabled());
  }

  final _$getCurrentPositionAsyncAction = AsyncAction('getCurrentPosition');

  @override
  Future<GeoPosition> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  final _$LocationStoreBaseActionController =
      ActionController(name: 'LocationStoreBase');

  @override
  void init() {
    final _$actionInfo = _$LocationStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$LocationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'hasPermission: ${hasPermission.toString()}';
    return '{$string}';
  }
}
