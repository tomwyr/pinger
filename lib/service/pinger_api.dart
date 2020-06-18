import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
    final countsDoc = _firestore.collection(_countsPath).document(_allPath);
    final countsSnap = await _runCall(countsDoc.get);
    return countsSnap.data != null
        ? GlobalPingCounts.fromJson(countsSnap.data)
        : GlobalPingCounts.empty();
  }

  Future<GlobalHostResults> getHostResults(String host) async {
    final hostDoc = _firestore.collection(_resultsPath).document(host);
    final resultsSnap = await _runCall(hostDoc.get);
    return resultsSnap.data != null
        ? GlobalHostResults.fromJson(resultsSnap.data)
        : GlobalHostResults.empty();
  }

  Future<void> saveSessionResult(GlobalSessionResult result) async {
    final sessionsCol = _firestore.collection(_sessionsPath);
    await _runCall(() => sessionsCol.add(result.toJson()));
  }

  Future<T> _runCall<T>(Future<T> call()) async {
    try {
      return await call();
    } on PlatformException catch (e) {
      switch (e.message) {
        case "Failed to get document because the client is offline.":
          throw ApiError.CLIENT_OFFLINE;
        case "PERMISSION_DENIED: Missing or insufficient permissions.":
          throw ApiError.ACCESS_DENIED;
      }
      rethrow;
    }
  }
}

enum ApiError {
  CLIENT_OFFLINE,
  ACCESS_DENIED,
}
