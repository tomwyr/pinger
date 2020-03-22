import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_result.dart';
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
  void init() {
    results = _pingerPrefs.getArchiveResults();
  }

  @action
  Future<void> deleteResult(int resultId) async {
    await _pingerPrefs.deleteArchiveResult(resultId);
    final entryIndex = results.indexWhere((it) => it.id == resultId);
    results = results.toList()..removeAt(entryIndex);
  }

  @action
  Future<int> saveResult(PingResult result) async {
    final resultId = await _pingerPrefs.saveArchiveResult(result);
    results = results.toList()..add(result.copyWith(id: resultId));
    return resultId;
  }
}
