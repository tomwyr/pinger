// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PingStore on PingStoreBase, Store {
  Computed<bool>? _$canArchiveResultComputed;

  @override
  bool get canArchiveResult => (_$canArchiveResultComputed ??= Computed<bool>(
          () => super.canArchiveResult,
          name: 'PingStoreBase.canArchiveResult'))
      .value;
  Computed<bool>? _$didChangeSettingsComputed;

  @override
  bool get didChangeSettings => (_$didChangeSettingsComputed ??= Computed<bool>(
          () => super.didChangeSettings,
          name: 'PingStoreBase.didChangeSettings'))
      .value;
  Computed<String?>? _$currentHostComputed;

  @override
  String? get currentHost =>
      (_$currentHostComputed ??= Computed<String?>(() => super.currentHost,
              name: 'PingStoreBase.currentHost'))
          .value;

  late final _$pingDurationAtom =
      Atom(name: 'PingStoreBase.pingDuration', context: context);

  @override
  Duration? get pingDuration {
    _$pingDurationAtom.reportRead();
    return super.pingDuration;
  }

  @override
  set pingDuration(Duration? value) {
    _$pingDurationAtom.reportWrite(value, super.pingDuration, () {
      super.pingDuration = value;
    });
  }

  late final _$currentSessionAtom =
      Atom(name: 'PingStoreBase.currentSession', context: context);

  @override
  PingSession? get currentSession {
    _$currentSessionAtom.reportRead();
    return super.currentSession;
  }

  @override
  set currentSession(PingSession? value) {
    _$currentSessionAtom.reportWrite(value, super.currentSession, () {
      super.currentSession = value;
    });
  }

  late final _$prevSessionAtom =
      Atom(name: 'PingStoreBase.prevSession', context: context);

  @override
  PingSession? get prevSession {
    _$prevSessionAtom.reportRead();
    return super.prevSession;
  }

  @override
  set prevSession(PingSession? value) {
    _$prevSessionAtom.reportWrite(value, super.prevSession, () {
      super.prevSession = value;
    });
  }

  late final _$prevStatusAtom =
      Atom(name: 'PingStoreBase.prevStatus', context: context);

  @override
  PingStatus? get prevStatus {
    _$prevStatusAtom.reportRead();
    return super.prevStatus;
  }

  @override
  set prevStatus(PingStatus? value) {
    _$prevStatusAtom.reportWrite(value, super.prevStatus, () {
      super.prevStatus = value;
    });
  }

  late final _$_archivedIdAtom =
      Atom(name: 'PingStoreBase._archivedId', context: context);

  @override
  int? get _archivedId {
    _$_archivedIdAtom.reportRead();
    return super._archivedId;
  }

  @override
  set _archivedId(int? value) {
    _$_archivedIdAtom.reportWrite(value, super._archivedId, () {
      super._archivedId = value;
    });
  }

  late final _$archiveResultAsyncAction =
      AsyncAction('PingStoreBase.archiveResult', context: context);

  @override
  Future<void> archiveResult() {
    return _$archiveResultAsyncAction.run(() => super.archiveResult());
  }

  late final _$PingStoreBaseActionController =
      ActionController(name: 'PingStoreBase', context: context);

  @override
  void init() {
    final _$actionInfo =
        _$PingStoreBaseActionController.startAction(name: 'PingStoreBase.init');
    try {
      return super.init();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initSession(String host) {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.initSession');
    try {
      return super.initSession(host);
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSettings(PingSettings settings) {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.updateSettings');
    try {
      return super.updateSettings(settings);
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSettings() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.clearSettings');
    try {
      return super.clearSettings();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.startQuickCheck');
    try {
      return super.startQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void lockQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.lockQuickCheck');
    try {
      return super.lockQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unlockQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.unlockQuickCheck');
    try {
      return super.unlockQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopQuickCheck() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.stopQuickCheck');
    try {
      return super.stopQuickCheck();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.startSession');
    try {
      return super.startSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pauseSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.pauseSession');
    try {
      return super.pauseSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resumeSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.resumeSession');
    try {
      return super.resumeSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.stopSession');
    try {
      return super.stopSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restartSession() {
    final _$actionInfo = _$PingStoreBaseActionController.startAction(
        name: 'PingStoreBase.restartSession');
    try {
      return super.restartSession();
    } finally {
      _$PingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pingDuration: ${pingDuration},
currentSession: ${currentSession},
prevSession: ${prevSession},
prevStatus: ${prevStatus},
canArchiveResult: ${canArchiveResult},
didChangeSettings: ${didChangeSettings},
currentHost: ${currentHost}
    ''';
  }
}
