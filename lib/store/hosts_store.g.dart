// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HostsStore on HostsStoreBase, Store {
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

  final _$hostsAtom = Atom(name: 'HostsStoreBase.hosts');

  @override
  List<HostItem> get hosts {
    _$hostsAtom.context.enforceReadPolicy(_$hostsAtom);
    _$hostsAtom.reportObserved();
    return super.hosts;
  }

  @override
  set hosts(List<HostItem> value) {
    _$hostsAtom.context.conditionallyRunInAction(() {
      super.hosts = value;
      _$hostsAtom.reportChanged();
    }, _$hostsAtom, name: '${_$hostsAtom.name}_set');
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

  final _$incrementStatsAsyncAction = AsyncAction('incrementStats');

  @override
  Future<void> incrementStats(String host) {
    return _$incrementStatsAsyncAction.run(() => super.incrementStats(host));
  }

  final _$searchAsyncAction = AsyncAction('search');

  @override
  Future<void> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  final _$HostsStoreBaseActionController =
      ActionController(name: 'HostsStoreBase');

  @override
  void init() {
    final _$actionInfo = _$HostsStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$HostsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'stats: ${stats.toString()},hosts: ${hosts.toString()},isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}
