import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_global.dart';
import 'package:pinger/model/ping_result.dart';
import 'package:pinger/service/pinger_api.dart';
import 'package:pinger/service/pinger_prefs.dart';

part 'archive_store.g.dart';

@singleton
class ArchiveStore extends ArchiveStoreBase with _$ArchiveStore {
  final PingerPrefs _pingerPrefs;
  final PingerApi _pingerApi;

  ArchiveStore(this._pingerPrefs, this._pingerApi);
}

abstract class ArchiveStoreBase with Store {
  PingerPrefs get _pingerPrefs;
  PingerApi get _pingerApi;

  @observable
  List<PingResult> localResults;

  @observable
  Map<String, GlobalHostResults> globalResults;

  @action
  void init() {
    localResults = _pingerPrefs.getArchiveResults();
    globalResults = {};
  }

  @action
  Future<void> fetchGlobalResults(String host) async {
    if (!globalResults.containsKey(host)) {
      final results = await _pingerApi.getHostResults(host);
      globalResults[host] = results;
    }
  }

  @action
  Future<void> deleteLocalResult(int resultId) async {
    await _pingerPrefs.deleteArchiveResult(resultId);
    final entryIndex = localResults.indexWhere((it) => it.id == resultId);
    localResults = localResults.toList()..removeAt(entryIndex);
  }

  @action
  Future<int> saveLocalResult(PingResult result) async {
    final resultId = await _pingerPrefs.saveArchiveResult(result);
    localResults = localResults.toList()..add(result.copyWith(id: resultId));
    return resultId;
  }
}
