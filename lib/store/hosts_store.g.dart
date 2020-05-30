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
          Computed<List<HostItem>>(() => super.searchResults,
              name: 'HostsStoreBase.searchResults'))
      .value;

  final _$_searchQueryAtom = Atom(name: 'HostsStoreBase._searchQuery');

  @override
  String get _searchQuery {
    _$_searchQueryAtom.reportRead();
    return super._searchQuery;
  }

  @override
  set _searchQuery(String value) {
    _$_searchQueryAtom.reportWrite(value, super._searchQuery, () {
      super._searchQuery = value;
    });
  }

  final _$_hostItemsAtom = Atom(name: 'HostsStoreBase._hostItems');

  @override
  List<HostItem> get _hostItems {
    _$_hostItemsAtom.reportRead();
    return super._hostItems;
  }

  @override
  set _hostItems(List<HostItem> value) {
    _$_hostItemsAtom.reportWrite(value, super._hostItems, () {
      super._hostItems = value;
    });
  }

  final _$statsAtom = Atom(name: 'HostsStoreBase.stats');

  @override
  Map<String, HostStats> get stats {
    _$statsAtom.reportRead();
    return super.stats;
  }

  @override
  set stats(Map<String, HostStats> value) {
    _$statsAtom.reportWrite(value, super.stats, () {
      super.stats = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HostsStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$initAsyncAction = AsyncAction('HostsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$incrementStatsAsyncAction =
      AsyncAction('HostsStoreBase.incrementStats');

  @override
  Future<void> incrementStats(String host) {
    return _$incrementStatsAsyncAction.run(() => super.incrementStats(host));
  }

  final _$removeStatsAsyncAction = AsyncAction('HostsStoreBase.removeStats');

  @override
  Future<void> removeStats(List<String> hosts) {
    return _$removeStatsAsyncAction.run(() => super.removeStats(hosts));
  }

  final _$HostsStoreBaseActionController =
      ActionController(name: 'HostsStoreBase');

  @override
  void search(String query) {
    final _$actionInfo = _$HostsStoreBaseActionController.startAction(
        name: 'HostsStoreBase.search');
    try {
      return super.search(query);
    } finally {
      _$HostsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stats: ${stats},
isLoading: ${isLoading},
searchResults: ${searchResults}
    ''';
  }
}
