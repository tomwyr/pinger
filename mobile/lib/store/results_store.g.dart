// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResultsStore on ResultsStoreBase, Store {
  late final _$localResultsAtom =
      Atom(name: 'ResultsStoreBase.localResults', context: context);

  @override
  List<PingResult?>? get localResults {
    _$localResultsAtom.reportRead();
    return super.localResults;
  }

  @override
  set localResults(List<PingResult?>? value) {
    _$localResultsAtom.reportWrite(value, super.localResults, () {
      super.localResults = value;
    });
  }

  late final _$globalResultsAtom =
      Atom(name: 'ResultsStoreBase.globalResults', context: context);

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

  late final _$fetchGlobalResultsAsyncAction =
      AsyncAction('ResultsStoreBase.fetchGlobalResults', context: context);

  @override
  Future<void> fetchGlobalResults(String host) {
    return _$fetchGlobalResultsAsyncAction
        .run(() => super.fetchGlobalResults(host));
  }

  late final _$deleteLocalResultAsyncAction =
      AsyncAction('ResultsStoreBase.deleteLocalResult', context: context);

  @override
  Future<void> deleteLocalResult(int? resultId) {
    return _$deleteLocalResultAsyncAction
        .run(() => super.deleteLocalResult(resultId));
  }

  late final _$saveLocalResultAsyncAction =
      AsyncAction('ResultsStoreBase.saveLocalResult', context: context);

  @override
  Future<int> saveLocalResult(PingResult result) {
    return _$saveLocalResultAsyncAction
        .run(() => super.saveLocalResult(result));
  }

  late final _$ResultsStoreBaseActionController =
      ActionController(name: 'ResultsStoreBase', context: context);

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
