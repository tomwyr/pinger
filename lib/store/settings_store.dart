import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_store.g.dart';

class SettingsStore extends SettingsStoreBase with _$SettingsStore {
  final SharedPreferences _sharedPrefs;

  SettingsStore(this._sharedPrefs);
}

abstract class SettingsStoreBase with Store {
  final String _userSettingsKey = 'userSettings';

  SharedPreferences get _sharedPrefs;

  @observable
  UserSettings userSettings;

  Future<UserSettings> initSettings() async {
    if (_sharedPrefs.containsKey(_userSettingsKey)) {
      final settingsJson =
          json.decode(_sharedPrefs.getString(_userSettingsKey));
      userSettings = UserSettings.fromJson(settingsJson);
    } else {
      await update(_createDefaultSettings());
    }
  }

  UserSettings _createDefaultSettings() => UserSettings(
        nightModeEnabled: false,
        rememberHost: true,
        showSystemNotification: false,
        shareSettings: ShareSettings(
          attachLocation: true,
          shareResults: false,
        ),
        pingSettings: PingSettings(
          count: 10,
          packetSize: 24,
          sendInterval: 2,
          timeout: 30,
        ),
      );

  @action
  Future<void> update(UserSettings newSettings) async {
    final settingsString = json.encode(newSettings.toJson());
    await _sharedPrefs.setString(_userSettingsKey, settingsString);
    userSettings = newSettings;
  }
}
