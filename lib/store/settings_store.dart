import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'settings_store.g.dart';

@singleton
class SettingsStore extends SettingsStoreBase with _$SettingsStore {
  final PackageInfo _packageInfo;
  final PingerPrefs _pingerPrefs;

  SettingsStore(this._packageInfo, this._pingerPrefs);
}

abstract class SettingsStoreBase with Store {
  PackageInfo get _packageInfo;
  PingerPrefs get _pingerPrefs;

  @observable
  UserSettings userSettings;

  @observable
  bool didShowIntro;

  @observable
  String appVersion;

  @action
  Future<void> init() async {
    didShowIntro = _pingerPrefs.getDidShowIntro() ?? false;
    userSettings = _getUserSettings();
    appVersion = _packageInfo.version;
  }

  UserSettings _getUserSettings() {
    var settings = _pingerPrefs.getUserSettings();
    if (settings == null) {
      settings = _createDefaultSettings();
      _pingerPrefs.saveUserSettings(settings);
    }
    return settings;
  }

  UserSettings _createDefaultSettings() => UserSettings(
        nightMode: false,
        restoreHost: false,
        showSystemNotification: false,
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: false,
        ),
        pingSettings: PingSettings(
          count: 10,
          packetSize: 56,
          interval: 1,
          timeout: 10,
        ),
      );

  @action
  Future<void> updateSettings(UserSettings settings) async {
    await _pingerPrefs.saveUserSettings(settings);
    userSettings = settings;
  }

  @action
  Future<void> notifyDidShowIntro() async {
    await _pingerPrefs.setDidShowIntro(true);
    didShowIntro = true;
  }
}
