import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info/package_info.dart';
import 'package:pinger/config.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'settings_store.g.dart';

@singleton
class SettingsStore extends SettingsStoreBase with _$SettingsStore {
  final PackageInfo _packageInfo;
  final PingerPrefs _pingerPrefs;
  final AppConfig _appConfig;

  SettingsStore(this._packageInfo, this._pingerPrefs, this._appConfig);
}

abstract class SettingsStoreBase with Store {
  PackageInfo get _packageInfo;
  PingerPrefs get _pingerPrefs;
  AppConfig get _appConfig;

  @observable
  UserSettings userSettings;

  @observable
  bool didShowIntro;

  @observable
  AppInfo appInfo;

  @action
  Future<void> init() async {
    didShowIntro = _pingerPrefs.getDidShowIntro() ?? false;
    userSettings = _getUserSettings();
    appInfo = AppInfo(
      name: _packageInfo.appName,
      version: _packageInfo.version,
      icon: _appConfig.iconPath,
      copyright: "© 2019 Tomasz Wyrowiński",
    );
  }

  UserSettings _getUserSettings() {
    var settings = _pingerPrefs.getUserSettings();
    if (settings == null) {
      settings = _createDefaultSettings();
      _pingerPrefs.saveUserSettings(settings);
    } else if (settings.traySettings == null) {
      settings = settings.copyWith(traySettings: _createDefaultTraySettings());
      _pingerPrefs.saveUserSettings(settings);
    }
    return settings;
  }

  UserSettings _createDefaultSettings() => UserSettings(
        nightMode: false,
        restoreHost: false,
        showSystemNotification: false,
        traySettings: _createDefaultTraySettings(),
        shareSettings: ShareSettings(
          shareResults: true,
          attachLocation: false,
        ),
        pingSettings: PingSettings(
          count: NumSetting.finite(10),
          packetSize: 56,
          interval: 1,
          timeout: 10,
        ),
      );

  TraySettings _createDefaultTraySettings() =>
      TraySettings(enabled: true, autoReveal: true);

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

class AppInfo {
  final String version;
  final String name;
  final String copyright;
  final String icon;

  AppInfo({
    @required this.version,
    @required this.name,
    @required this.icon,
    @required this.copyright,
  });
}
