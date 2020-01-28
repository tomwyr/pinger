import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = HistoryStoreBase with _$HistoryStore;

abstract class HistoryStoreBase with Store {
  @observable
  List<HistoryItem> items = [
    HistoryItem(
      'dropbox.com',
      DateTime.now().subtract(Duration(minutes: 3)),
    ),
    HistoryItem(
      'youtube.com',
      DateTime.now().subtract(Duration(hours: 8)),
    ),
    HistoryItem(
      'twitch.tv',
      DateTime.now().subtract(Duration(days: 17)),
    ),
  ];
}

class HistoryItem {
  final String host;
  final DateTime timestamp;

  HistoryItem(this.host, this.timestamp);
}
