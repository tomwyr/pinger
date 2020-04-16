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
    _$localResultsAtom.context.enforceReadPolicy(_$localResultsAtom);
    _$localResultsAtom.reportObserved();
    return super.localResults;
  }

  @override
  set localResults(List<PingResult> value) {
    _$localResultsAtom.context.conditionallyRunInAction(() {
      super.localResults = value;
      _$localResultsAtom.reportChanged();
    }, _$localResultsAtom, name: '${_$localResultsAtom.name}_set');
  }

  final _$globalResultsAtom = Atom(name: 'ArchiveStoreBase.globalResults');

  @override
  Map<String, GlobalHostResults> get globalResults {
    _$globalResultsAtom.context.enforceReadPolicy(_$globalResultsAtom);
    _$globalResultsAtom.reportObserved();
    return super.globalResults;
  }

  @override
  set globalResults(Map<String, GlobalHostResults> value) {
    _$globalResultsAtom.context.conditionallyRunInAction(() {
      super.globalResults = value;
      _$globalResultsAtom.reportChanged();
    }, _$globalResultsAtom, name: '${_$globalResultsAtom.name}_set');
  }

  final _$fetchGlobalResultsAsyncAction = AsyncAction('fetchGlobalResults');

  @override
  Future<void> fetchGlobalResults(String host) {
    return _$fetchGlobalResultsAsyncAction
        .run(() => super.fetchGlobalResults(host));
  }

  final _$deleteLocalResultAsyncAction = AsyncAction('deleteLocalResult');

  @override
  Future<void> deleteLocalResult(int resultId) {
    return _$deleteLocalResultAsyncAction
        .run(() => super.deleteLocalResult(resultId));
  }

  final _$saveLocalResultAsyncAction = AsyncAction('saveLocalResult');

  @override
  Future<int> saveLocalResult(PingResult result) {
    return _$saveLocalResultAsyncAction
        .run(() => super.saveLocalResult(result));
  }

  final _$ArchiveStoreBaseActionController =
      ActionController(name: 'ArchiveStoreBase');

  @override
  void init() {
    final _$actionInfo = _$ArchiveStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$ArchiveStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'localResults: ${localResults.toString()},globalResults: ${globalResults.toString()}';
    return '{$string}';
  }
}
