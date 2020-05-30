// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArchiveStore on ArchiveStoreBase, Store {
  final _$localResultsAtom = Atom(name: 'ArchiveStoreBase.localResults');

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

  final _$globalResultsAtom = Atom(name: 'ArchiveStoreBase.globalResults');

  @override
  Map<String, GlobalHostResults> get globalResults {
    _$globalResultsAtom.reportRead();
    return super.globalResults;
  }

  @override
  set globalResults(Map<String, GlobalHostResults> value) {
    _$globalResultsAtom.reportWrite(value, super.globalResults, () {
      super.globalResults = value;
    });
  }

  final _$fetchGlobalResultsAsyncAction =
      AsyncAction('ArchiveStoreBase.fetchGlobalResults');

  @override
  Future<void> fetchGlobalResults(String host) {
    return _$fetchGlobalResultsAsyncAction
        .run(() => super.fetchGlobalResults(host));
  }

  final _$deleteLocalResultAsyncAction =
      AsyncAction('ArchiveStoreBase.deleteLocalResult');

  @override
  Future<void> deleteLocalResult(int resultId) {
    return _$deleteLocalResultAsyncAction
        .run(() => super.deleteLocalResult(resultId));
  }

  final _$saveLocalResultAsyncAction =
      AsyncAction('ArchiveStoreBase.saveLocalResult');

  @override
  Future<int> saveLocalResult(PingResult result) {
    return _$saveLocalResultAsyncAction
        .run(() => super.saveLocalResult(result));
  }

  final _$ArchiveStoreBaseActionController =
      ActionController(name: 'ArchiveStoreBase');

  @override
  void init() {
    final _$actionInfo = _$ArchiveStoreBaseActionController.startAction(
        name: 'ArchiveStoreBase.init');
    try {
      return super.init();
    } finally {
      _$ArchiveStoreBaseActionController.endAction(_$actionInfo);
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
