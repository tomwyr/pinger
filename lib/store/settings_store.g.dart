// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on SettingsStoreBase, Store {
  final _$userSettingsAtom = Atom(name: 'SettingsStoreBase.userSettings');

  @override
  UserSettings get userSettings {
    _$userSettingsAtom.reportRead();
    return super.userSettings;
  }

  @override
  set userSettings(UserSettings value) {
    _$userSettingsAtom.reportWrite(value, super.userSettings, () {
      super.userSettings = value;
    });
  }

  final _$updateAsyncAction = AsyncAction('SettingsStoreBase.update');

  @override
  Future<void> update(UserSettings settings) {
    return _$updateAsyncAction.run(() => super.update(settings));
  }

  final _$SettingsStoreBaseActionController =
      ActionController(name: 'SettingsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$SettingsStoreBaseActionController.startAction(
        name: 'SettingsStoreBase.init');
    try {
      return super.init();
    } finally {
      _$SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userSettings: ${userSettings}
    ''';
  }
}
