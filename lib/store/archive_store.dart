import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_session.dart';
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
  List<PingSession> sessions;

  @action
  void init() {
    sessions = _pingerPrefs.getArchiveSessions() ?? [
      PingSession(
        host: "dropbox.com",
        timestamp: DateTime.now().subtract(Duration(days: 10)),
        results: PingResults.fromValues([30.0, 75.0, 34.0, 59.0, 3.0, 13.0, 205.0, 12.0, 120.0]),
      ),
      PingSession(
        host: "youtube.com",
        timestamp: DateTime.now().subtract(Duration(minutes: 17)),
        results: PingResults.fromValues([120.0, 200.0, 80.0, 192.0]),
      ),
    ];
  }
}
