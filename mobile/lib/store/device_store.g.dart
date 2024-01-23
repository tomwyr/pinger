// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeviceStore on DeviceStoreBase, Store {
  late final _$isNetworkEnabledAtom =
      Atom(name: 'DeviceStoreBase.isNetworkEnabled', context: context);

  @override
  bool? get isNetworkEnabled {
    _$isNetworkEnabledAtom.reportRead();
    return super.isNetworkEnabled;
  }

  @override
  set isNetworkEnabled(bool? value) {
    _$isNetworkEnabledAtom.reportWrite(value, super.isNetworkEnabled, () {
      super.isNetworkEnabled = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('DeviceStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getCurrentPositionAsyncAction =
      AsyncAction('DeviceStoreBase.getCurrentPosition', context: context);

  @override
  Future<GeoPosition> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  @override
  String toString() {
    return '''
isNetworkEnabled: ${isNetworkEnabled}
    ''';
  }
}
