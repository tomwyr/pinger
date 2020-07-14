// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on LocationStoreBase, Store {
  Computed<bool> _$canAccessLocationComputed;

  @override
  bool get canAccessLocation => (_$canAccessLocationComputed ??= Computed<bool>(
          () => super.canAccessLocation,
          name: 'LocationStoreBase.canAccessLocation'))
      .value;

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

  final _$isServiceEnabledAtom =
      Atom(name: 'LocationStoreBase.isServiceEnabled');

  @override
  bool get isServiceEnabled {
    _$isServiceEnabledAtom.reportRead();
    return super.isServiceEnabled;
  }

  @override
  set isServiceEnabled(bool value) {
    _$isServiceEnabledAtom.reportWrite(value, super.isServiceEnabled, () {
      super.isServiceEnabled = value;
    });
  }

  final _$initAsyncAction = AsyncAction('LocationStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_updateAccessStatusAsyncAction =
      AsyncAction('LocationStoreBase._updateAccessStatus');

  @override
  Future<void> _updateAccessStatus() {
    return _$_updateAccessStatusAsyncAction
        .run(() => super._updateAccessStatus());
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
hasPermission: ${hasPermission},
isServiceEnabled: ${isServiceEnabled},
canAccessLocation: ${canAccessLocation}
    ''';
  }
}
