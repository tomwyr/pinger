import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PingerPrefs {
  final String _userSettingsKey = 'userSettings';

  final SharedPreferences _sharedPrefs;

  PingerPrefs(this._sharedPrefs);

  UserSettings getUserSettings() {
    if (_sharedPrefs.containsKey(_userSettingsKey)) {
      final json = jsonDecode(_sharedPrefs.getString(_userSettingsKey));
      return UserSettings.fromJson(json);
    }
    return null;
  }

  Future<void> saveUserSettings(UserSettings settings) async {
    final jsonString = jsonEncode(settings.toJson());
    await _sharedPrefs.setString(_userSettingsKey, jsonString);
  }
}
