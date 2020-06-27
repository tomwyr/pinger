// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

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

  final _$didShowIntroAtom = Atom(name: 'SettingsStoreBase.didShowIntro');

  @override
  bool get didShowIntro {
    _$didShowIntroAtom.reportRead();
    return super.didShowIntro;
  }

  @override
  set didShowIntro(bool value) {
    _$didShowIntroAtom.reportWrite(value, super.didShowIntro, () {
      super.didShowIntro = value;
    });
  }

  final _$appVersionAtom = Atom(name: 'SettingsStoreBase.appVersion');

  @override
  String get appVersion {
    _$appVersionAtom.reportRead();
    return super.appVersion;
  }

  @override
  set appVersion(String value) {
    _$appVersionAtom.reportWrite(value, super.appVersion, () {
      super.appVersion = value;
    });
  }

  final _$initAsyncAction = AsyncAction('SettingsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$updateSettingsAsyncAction =
      AsyncAction('SettingsStoreBase.updateSettings');

  @override
  Future<void> updateSettings(UserSettings settings) {
    return _$updateSettingsAsyncAction
        .run(() => super.updateSettings(settings));
  }

  final _$notifyDidShowIntroAsyncAction =
      AsyncAction('SettingsStoreBase.notifyDidShowIntro');

  @override
  Future<void> notifyDidShowIntro() {
    return _$notifyDidShowIntroAsyncAction
        .run(() => super.notifyDidShowIntro());
  }

  @override
  String toString() {
    return '''
userSettings: ${userSettings},
didShowIntro: ${didShowIntro},
appVersion: ${appVersion}
    ''';
  }
}
