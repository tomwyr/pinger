// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HostsStore on HostsStoreBase, Store {
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

  final _$searchAsyncAction = AsyncAction('search');

  @override
  Future<void> search(String query) {
    return _$searchAsyncAction.run(() => super.search(query));
  }

  @override
  String toString() {
    final string =
        'hosts: ${hosts.toString()},isLoading: ${isLoading.toString()}';
    return '{$string}';
  }
}
