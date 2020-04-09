import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class PingerApi {
  final String _allPath = 'all';
  final String _countsPath = 'counts-monthly';
  final String _resultsPath = 'results-monthly';
  final String _sessionsPath = 'session';

  final Firestore _firestore;

  PingerApi(this._firestore);
}
