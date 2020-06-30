// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultsStore on ResultsStoreBase, Store {
  final _$localResultsAtom = Atom(name: 'ResultsStoreBase.localResults');

  @override
  List<PingResult> get localResults {
    _$localResultsAtom.reportRead();
    return super.localResults;
  }

  @override
  set localResults(List<PingResult> value) {
    _$localResultsAtom.reportWrite(value, super.localResults, () {
      super.localResults = value;
    });
  }

  final _$globalResultsAtom = Atom(name: 'ResultsStoreBase.globalResults');

  @override
  Map<String, DataSnap<GlobalHostResults>> get globalResults {
    _$globalResultsAtom.reportRead();
    return super.globalResults;
  }

  @override
  set globalResults(Map<String, DataSnap<GlobalHostResults>> value) {
    _$globalResultsAtom.reportWrite(value, super.globalResults, () {
      super.globalResults = value;
    });
  }

  final _$fetchGlobalResultsAsyncAction =
      AsyncAction('ResultsStoreBase.fetchGlobalResults');

  @override
  Future<void> fetchGlobalResults(String host) {
    return _$fetchGlobalResultsAsyncAction
        .run(() => super.fetchGlobalResults(host));
  }

  final _$deleteLocalResultAsyncAction =
      AsyncAction('ResultsStoreBase.deleteLocalResult');

  @override
  Future<void> deleteLocalResult(int resultId) {
    return _$deleteLocalResultAsyncAction
        .run(() => super.deleteLocalResult(resultId));
  }

  final _$saveLocalResultAsyncAction =
      AsyncAction('ResultsStoreBase.saveLocalResult');

  @override
  Future<int> saveLocalResult(PingResult result) {
    return _$saveLocalResultAsyncAction
        .run(() => super.saveLocalResult(result));
  }

  final _$ResultsStoreBaseActionController =
      ActionController(name: 'ResultsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$ResultsStoreBaseActionController.startAction(
        name: 'ResultsStoreBase.init');
    try {
      return super.init();
    } finally {
      _$ResultsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
localResults: ${localResults},
globalResults: ${globalResults}
    ''';
  }
}
