// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on SettingsStoreBase, Store {
  late final _$userSettingsAtom =
      Atom(name: 'SettingsStoreBase.userSettings', context: context);

  @override
  UserSettings? get userSettings {
    _$userSettingsAtom.reportRead();
    return super.userSettings;
  }

  @override
  set userSettings(UserSettings? value) {
    _$userSettingsAtom.reportWrite(value, super.userSettings, () {
      super.userSettings = value;
    });
  }

  late final _$didShowIntroAtom =
      Atom(name: 'SettingsStoreBase.didShowIntro', context: context);

  @override
  bool? get didShowIntro {
    _$didShowIntroAtom.reportRead();
    return super.didShowIntro;
  }

  @override
  set didShowIntro(bool? value) {
    _$didShowIntroAtom.reportWrite(value, super.didShowIntro, () {
      super.didShowIntro = value;
    });
  }

  late final _$appInfoAtom =
      Atom(name: 'SettingsStoreBase.appInfo', context: context);

  @override
  AppInfo? get appInfo {
    _$appInfoAtom.reportRead();
    return super.appInfo;
  }

  @override
  set appInfo(AppInfo? value) {
    _$appInfoAtom.reportWrite(value, super.appInfo, () {
      super.appInfo = value;
    });
  }

  late final _$privacyPolicyUrlAtom =
      Atom(name: 'SettingsStoreBase.privacyPolicyUrl', context: context);

  @override
  String get privacyPolicyUrl {
    _$privacyPolicyUrlAtom.reportRead();
    return super.privacyPolicyUrl;
  }

  @override
  set privacyPolicyUrl(String value) {
    _$privacyPolicyUrlAtom.reportWrite(value, super.privacyPolicyUrl, () {
      super.privacyPolicyUrl = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('SettingsStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$updateSettingsAsyncAction =
      AsyncAction('SettingsStoreBase.updateSettings', context: context);

  @override
  Future<void> updateSettings(UserSettings settings) {
    return _$updateSettingsAsyncAction
        .run(() => super.updateSettings(settings));
  }

  late final _$notifyDidShowIntroAsyncAction =
      AsyncAction('SettingsStoreBase.notifyDidShowIntro', context: context);

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
appInfo: ${appInfo},
privacyPolicyUrl: ${privacyPolicyUrl}
    ''';
  }
}
