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
    _$userSettingsAtom.context.enforceReadPolicy(_$userSettingsAtom);
    _$userSettingsAtom.reportObserved();
    return super.userSettings;
  }

  @override
  set userSettings(UserSettings value) {
    _$userSettingsAtom.context.conditionallyRunInAction(() {
      super.userSettings = value;
      _$userSettingsAtom.reportChanged();
    }, _$userSettingsAtom, name: '${_$userSettingsAtom.name}_set');
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future<void> update(UserSettings settings) {
    return _$updateAsyncAction.run(() => super.update(settings));
  }
}
