import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/model/ping_global.dart';

@injectable
class PingerApi {
  final String _allPath = 'all';
  final String _countsPath = 'counts-monthly';
  final String _resultsPath = 'results-monthly';
  final String _sessionsPath = 'sessions';

  final Firestore _firestore;

  PingerApi(this._firestore);

  Future<GlobalPingCounts> getPingCounts() async {
    final countsSnap =
        await _firestore.collection(_countsPath).document(_allPath).get();
    return GlobalPingCounts.fromJson(countsSnap.data);
  }

  Future<GlobalHostResults> getHostResults(String host) async {
    final resultsSnap =
        await _firestore.collection(_resultsPath).document(host).get();
    return GlobalHostResults.fromJson(resultsSnap.data);
  }

  Future<void> saveSessionResult(GlobalSessionResult result) async {
    await _firestore.collection(_sessionsPath).add(result.toJson());
  }
}
