// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PingStore on PingStoreBase, Store {
  Computed<bool> _$isArchivedComputed;

  @override
  bool get isArchived =>
      (_$isArchivedComputed ??= Computed<bool>(() => super.isArchived)).value;

  final _$pingDurationAtom = Atom(name: 'PingStoreBase.pingDuration');

  @override
  Duration get pingDuration {
    _$pingDurationAtom.context.enforceReadPolicy(_$pingDurationAtom);
    _$pingDurationAtom.reportObserved();
    return super.pingDuration;
  }

  @override
  set pingDuration(Duration value) {
    _$pingDurationAtom.context.conditionallyRunInAction(() {
      super.pingDuration = value;
      _$pingDurationAtom.reportChanged();
    }, _$pingDurationAtom, name: '${_$pingDurationAtom.name}_set');
  }

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

  final _$_archivedIdAtom = Atom(name: 'PingStoreBase._archivedId');

  @override
  int get _archivedId {
    _$_archivedIdAtom.context.enforceReadPolicy(_$_archivedIdAtom);
    _$_archivedIdAtom.reportObserved();
    return super._archivedId;
  }

  @override
  set _archivedId(int value) {
    _$_archivedIdAtom.context.conditionallyRunInAction(() {
      super._archivedId = value;
      _$_archivedIdAtom.reportChanged();
    }, _$_archivedIdAtom, name: '${_$_archivedIdAtom.name}_set');
  }

  final _$saveResultAsyncAction = AsyncAction('saveResult');

  @override
  Future<void> saveResult() {
    return _$saveResultAsyncAction.run(() => super.saveResult());
  }

  final _$deleteResultAsyncAction = AsyncAction('deleteResult');

  @override
  Future<void> deleteResult() {
    return _$deleteResultAsyncAction.run(() => super.deleteResult());
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
    final string =
        'pingDuration: ${pingDuration.toString()},currentSession: ${currentSession.toString()},isArchived: ${isArchived.toString()}';
    return '{$string}';
  }
}
