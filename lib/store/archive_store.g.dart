// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArchiveStore on ArchiveStoreBase, Store {
  final _$resultsAtom = Atom(name: 'ArchiveStoreBase.results');

  @override
  List<PingResult> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(List<PingResult> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
  }

  final _$deleteResultAsyncAction = AsyncAction('deleteResult');

  @override
  Future<void> deleteResult(int resultId) {
    return _$deleteResultAsyncAction.run(() => super.deleteResult(resultId));
  }

  final _$saveResultAsyncAction = AsyncAction('saveResult');

  @override
  Future<int> saveResult(PingResult result) {
    return _$saveResultAsyncAction.run(() => super.saveResult(result));
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
    final string = 'results: ${results.toString()}';
    return '{$string}';
  }
}
