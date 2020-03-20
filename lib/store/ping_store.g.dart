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
  void startQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.startQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.stopQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.startSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.pauseSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resumeSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.resumeSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.stopSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restart() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction();
    try {
      return super.restart();
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
