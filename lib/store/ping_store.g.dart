// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PingStore on PingStoreBase, Store {
  final _$currentSessionAtom = Atom(name: 'PingStoreBase.currentSession');

  @override
  PingSession get currentSession {
    _$currentSessionAtom.context.enforceReadPolicy(_$currentSessionAtom);
    _$currentSessionAtom.reportObserved();
    return super.currentSession;
  }

  @override
  set currentSession(PingSession value) {
    _$currentSessionAtom.context.conditionallyRunInAction(() {
      super.currentSession = value;
      _$currentSessionAtom.reportChanged();
    }, _$currentSessionAtom, name: '${_$currentSessionAtom.name}_set');
  }

  final _$PingStoreBaseActionController =
      ActionController(name: 'PingStoreBase');

  @override
  void initSession(String host) {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.initSession(host);
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'currentSession: ${currentSession.toString()}';
    return '{$string}';
  }
}
