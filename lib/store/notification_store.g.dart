// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationStore on NotificationStoreBase, Store {
  final _$_isSettingEnabledAtom =
      Atom(name: 'NotificationStoreBase._isSettingEnabled');

  @override
  bool get _isSettingEnabled {
    _$_isSettingEnabledAtom.reportRead();
    return super._isSettingEnabled;
  }

  @override
  set _isSettingEnabled(bool value) {
    _$_isSettingEnabledAtom.reportWrite(value, super._isSettingEnabled, () {
      super._isSettingEnabled = value;
    });
  }

  final _$NotificationStoreBaseActionController =
      ActionController(name: 'NotificationStoreBase');

  @override
  void init() {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.init');
    try {
      return super.init();
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
