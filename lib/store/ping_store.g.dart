// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PingStore on PingStoreBase, Store {
  final _$currentPingAtom = Atom(name: 'PingStoreBase.currentPing');

  @override
  Ping get currentPing {
    _$currentPingAtom.context.enforceReadPolicy(_$currentPingAtom);
    _$currentPingAtom.reportObserved();
    return super.currentPing;
  }

  @override
  set currentPing(Ping value) {
    _$currentPingAtom.context.conditionallyRunInAction(() {
      super.currentPing = value;
      _$currentPingAtom.reportChanged();
    }, _$currentPingAtom, name: '${_$currentPingAtom.name}_set');
  }

  final _$PingStoreBaseActionController =
      ActionController(name: 'PingStoreBase');

  @override
  void start(String host) {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.start(host);
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'currentPing: ${currentPing.toString()}';
    return '{$string}';
  }
}
