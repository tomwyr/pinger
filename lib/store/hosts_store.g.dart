// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HostsStore on HostsStoreBase, Store {
  Computed<List<HostItem>?>? _$searchResultsComputed;

  @override
  List<HostItem>? get searchResults => (_$searchResultsComputed ??=
          Computed<List<HostItem>?>(() => super.searchResults,
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

  final _$hostsAtom = Atom(name: 'HostsStoreBase.hosts');

  @override
  DataSnap<List<HostItem>>? get hosts {
    _$hostsAtom.reportRead();
    return super.hosts;
  }

  @override
  set hosts(DataSnap<List<HostItem>>? value) {
    _$hostsAtom.reportWrite(value, super.hosts, () {
      super.hosts = value;
    });
  }

  final _$localStatsAtom = Atom(name: 'HostsStoreBase.localStats');

  @override
  Map<String, HostStats>? get localStats {
    _$localStatsAtom.reportRead();
    return super.localStats;
  }

  @override
  set localStats(Map<String, HostStats>? value) {
    _$localStatsAtom.reportWrite(value, super.localStats, () {
      super.localStats = value;
    });
  }

  final _$favoritesAtom = Atom(name: 'HostsStoreBase.favorites');

  @override
  List<String>? get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<String>? value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$initAsyncAction = AsyncAction('HostsStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchHostsAsyncAction = AsyncAction('HostsStoreBase.fetchHosts');

  @override
  Future<void> fetchHosts() {
    return _$fetchHostsAsyncAction.run(() => super.fetchHosts());
  }

  final _$addFavoriteAsyncAction = AsyncAction('HostsStoreBase.addFavorite');

  @override
  Future<void> addFavorite(String host) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(host));
  }

  final _$removeFavoritesAsyncAction =
      AsyncAction('HostsStoreBase.removeFavorites');

  @override
  Future<void> removeFavorites(List<String> hosts) {
    return _$removeFavoritesAsyncAction.run(() => super.removeFavorites(hosts));
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

  final _$_tryLoadFaviconAsyncAction =
      AsyncAction('HostsStoreBase._tryLoadFavicon');

  @override
  Future<void> _tryLoadFavicon(String host) {
    return _$_tryLoadFaviconAsyncAction.run(() => super._tryLoadFavicon(host));
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
hosts: ${hosts},
localStats: ${localStats},
favorites: ${favorites},
searchResults: ${searchResults}
    ''';
  }
}
