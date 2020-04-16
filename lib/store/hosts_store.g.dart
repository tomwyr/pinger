// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HostsStore on HostsStoreBase, Store {
  Computed<List<HostItem>> _$searchResultsComputed;

  @override
  List<HostItem> get searchResults => (_$searchResultsComputed ??=
          Computed<List<HostItem>>(() => super.searchResults))
      .value;

  final _$_searchQueryAtom = Atom(name: 'HostsStoreBase._searchQuery');

  @override
  String get _searchQuery {
    _$_searchQueryAtom.context.enforceReadPolicy(_$_searchQueryAtom);
    _$_searchQueryAtom.reportObserved();
    return super._searchQuery;
  }

  @override
  set _searchQuery(String value) {
    _$_searchQueryAtom.context.conditionallyRunInAction(() {
      super._searchQuery = value;
      _$_searchQueryAtom.reportChanged();
    }, _$_searchQueryAtom, name: '${_$_searchQueryAtom.name}_set');
  }

  final _$_hostItemsAtom = Atom(name: 'HostsStoreBase._hostItems');

  @override
  List<HostItem> get _hostItems {
    _$_hostItemsAtom.context.enforceReadPolicy(_$_hostItemsAtom);
    _$_hostItemsAtom.reportObserved();
    return super._hostItems;
  }

  @override
  set _hostItems(List<HostItem> value) {
    _$_hostItemsAtom.context.conditionallyRunInAction(() {
      super._hostItems = value;
      _$_hostItemsAtom.reportChanged();
    }, _$_hostItemsAtom, name: '${_$_hostItemsAtom.name}_set');
  }

  final _$statsAtom = Atom(name: 'HostsStoreBase.stats');

  @override
  List<HostStats> get stats {
    _$statsAtom.context.enforceReadPolicy(_$statsAtom);
    _$statsAtom.reportObserved();
    return super.stats;
  }

  @override
  set stats(List<HostStats> value) {
    _$statsAtom.context.conditionallyRunInAction(() {
      super.stats = value;
      _$statsAtom.reportChanged();
    }, _$statsAtom, name: '${_$statsAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: 'HostsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$incrementStatsAsyncAction = AsyncAction('incrementStats');

  @override
  Future<void> incrementStats(String host) {
    return _$incrementStatsAsyncAction.run(() => super.incrementStats(host));
  }

  final _$HostsStoreBaseActionController =
      ActionController(name: 'HostsStoreBase');

  @override
  void search(String query) {
    final _$actionInfo = _$HostsStoreBaseActionController.startAction();
    try {
      return super.search(query);
    } finally {
      _$HostsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'stats: ${stats.toString()},isLoading: ${isLoading.toString()},searchResults: ${searchResults.toString()}';
    return '{$string}';
  }
}
