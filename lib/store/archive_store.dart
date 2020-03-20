import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/fake_data.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'archive_store.g.dart';

@singleton
class ArchiveStore extends ArchiveStoreBase with _$ArchiveStore {
  final PingerPrefs _pingerPrefs;

  ArchiveStore(this._pingerPrefs);
}

abstract class ArchiveStoreBase with Store {
  PingerPrefs get _pingerPrefs;

  @observable
  List<PingResult> results;

  @action
  Future<void> deleteResult(int resultId) async {
    await _pingerPrefs.deleteArchiveResult(resultId);
    final entryIndex = results.indexWhere((it) => it.id == resultId);
    results = results.toList()..removeAt(entryIndex);
  }

  @action
  void init() {
    results = _pingerPrefs.getArchiveResults() ?? [];
    if (results.isEmpty)
      results.addAll([
        PingResult(
          id: 0,
          host: FakeData.hosts.dropbox,
          timestamp: DateTime.now().subtract(Duration(minutes: 10)),
          duration: Duration(minutes: 8, seconds: 7),
          settings: PingSettings(
            count: 20,
            packetSize: 24,
            interval: 3,
            timeout: 30,
          ),
          values: [
            30.0,
            75.0,
            34.0,
            59.0,
            3.0,
            13.0,
            205.0,
            12.0,
            120.0,
            22.0,
            64.0,
            48.0,
            51.0,
          ],
        ),
        PingResult(
          id: 1,
          host: FakeData.hosts.youtube,
          timestamp: DateTime.now().subtract(Duration(hours: 17)),
          duration: Duration(minutes: 3, seconds: 2),
          settings: PingSettings(
            count: 10,
            packetSize: 24,
            interval: 1,
            timeout: 12,
          ),
          values: List.generate(10, (_) => Random().nextDouble() * 50.0),
        ),
        PingResult(
          id: 2,
          host: FakeData.hosts.dropbox,
          timestamp: DateTime.now().subtract(Duration(days: 3)),
          duration: Duration(minutes: 35, seconds: 58),
          settings: PingSettings(
            count: 120,
            packetSize: 48,
            interval: 5,
            timeout: 10,
          ),
          values: List.generate(120, (_) => Random().nextDouble() * 50.0),
        ),
        PingResult(
          id: 3,
          host: FakeData.hosts.dropbox,
          timestamp: DateTime.now().subtract(Duration(days: 22)),
          duration: Duration(minutes: 99, seconds: 44),
          settings: PingSettings(
            count: 4,
            packetSize: 10,
            interval: 2,
            timeout: 5,
          ),
          values: [37.0, 88.0, 76.0, 92.0],
        ),
      ]);
  }
}
