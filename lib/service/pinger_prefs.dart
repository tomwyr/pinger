import 'dart:convert';
import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:pinger/model/host_stats.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PingerPrefs {
  final String _userSettingsKey = 'userSettings';
  final String _archiveResultsKey = 'archiveResults';
  final String _favoriteHostsKey = 'favoriteHosts';
  final String _hostsStatsKey = 'hostsStats';
  final String _lastHostKey = 'lastHost';

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
    return [];
  }

  Future<int> saveArchiveResult(PingResult result) async {
    final allResults = getArchiveResults();
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
    final allResults = getArchiveResults();
    allResults.removeWhere((it) => it.id == resultId);
    final jsonStringList =
        allResults.map((it) => it.toJson()).map(jsonEncode).toList();
    await _sharedPrefs.setStringList(_archiveResultsKey, jsonStringList);
  }

  List<String> getFavoriteHosts() {
    if (_sharedPrefs.containsKey(_favoriteHostsKey)) {
      return _sharedPrefs.getStringList(_favoriteHostsKey);
    }
    return [];
  }

  Future<void> addFavoriteHost(String host) async {
    final allHosts = getFavoriteHosts();
    if (!allHosts.contains(host)) {
      allHosts.add(host);
      await _sharedPrefs.setStringList(_favoriteHostsKey, allHosts);
    }
  }

  Future<void> removeFavoriteHost(String host) async {
    final allHosts = getFavoriteHosts();
    if (allHosts.contains(host)) {
      allHosts.remove(host);
      await _sharedPrefs.setStringList(_favoriteHostsKey, allHosts);
    }
  }

  List<HostStats> getHostsStats() {
    if (_sharedPrefs.containsKey(_hostsStatsKey)) {
      return _sharedPrefs
          .getStringList(_hostsStatsKey)
          .map((it) => jsonDecode(it) as Map<String, dynamic>)
          .map((it) => HostStats.fromJson(it))
          .toList();
    }
    return [];
  }

  Future<void> saveHostsStats(List<HostStats> stats) async {
    final jsonStringList = stats.map((it) => jsonEncode(it.toJson())).toList();
    await _sharedPrefs.setStringList(_hostsStatsKey, jsonStringList);
  }

  String getLastHost() => _sharedPrefs.getString(_lastHostKey);

  Future<void> setLastHost(String host) =>
      _sharedPrefs.setString(_lastHostKey, host);
}
