import 'dart:convert';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PingerPrefs {
  final String _userSettingsKey = 'userSettings';
  final String _archiveResultsKey = 'archiveResults';

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

  List<PingResult> getArchiveResults() {
    if (_sharedPrefs.containsKey(_archiveResultsKey)) {
      return _sharedPrefs
          .getStringList(_archiveResultsKey)
          .map(jsonDecode)
          .map((it) => PingResult.fromJson(it as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<int> saveArchiveResult(PingResult result) async {
    final allResults = getArchiveResults() ?? [];
    final resultId = _getNewResultId(allResults);
    allResults.add(result.copyWith(id: resultId));
    final jsonStringList =
        allResults.map((it) => it.toJson()).map(jsonEncode).toList();
    await _sharedPrefs.setStringList(_archiveResultsKey, jsonStringList);
    return resultId;
  }

  int _getNewResultId(List<PingResult> results) {
    while (true) {
      final id = Random().nextInt(100000);
      if (results.every((it) => it.id != id)) {
        return id;
      }
    }
  }

  Future<void> deleteArchiveResult(int resultId) async {
    final allResults = getArchiveResults() ?? [];
    allResults.removeWhere((it) => it.id == resultId);
    final jsonStringList =
        allResults.map((it) => it.toJson()).map(jsonEncode).toList();
    await _sharedPrefs.setStringList(_archiveResultsKey, jsonStringList);
  }
}
