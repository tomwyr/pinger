import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PingerPrefs {
  final String _userSettingsKey = 'userSettings';
  final String _archiveSessionsKey = 'archiveSessions';

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

  List<PingSession> getArchiveSessions() {
    if (_sharedPrefs.containsKey(_archiveSessionsKey)) {
      return _sharedPrefs
          .getStringList(_archiveSessionsKey)
          .map(jsonDecode)
          .map((it) => PingSession.fromJson(it as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<void> saveArchiveSession(PingSession session) async {
    final allSessions = (getArchiveSessions() ?? [])..add(session);
    final jsonStringList =
        allSessions.map((it) => it.toJson()).map(jsonEncode).toList();
    await _sharedPrefs.setStringList(_archiveSessionsKey, jsonStringList);
  }
}
