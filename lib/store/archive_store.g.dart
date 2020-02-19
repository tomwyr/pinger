// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArchiveStore on ArchiveStoreBase, Store {
  final _$sessionsAtom = Atom(name: 'ArchiveStoreBase.sessions');

  @override
  List<PingSession> get sessions {
    _$sessionsAtom.context.enforceReadPolicy(_$sessionsAtom);
    _$sessionsAtom.reportObserved();
    return super.sessions;
  }

  @override
  set sessions(List<PingSession> value) {
    _$sessionsAtom.context.conditionallyRunInAction(() {
      super.sessions = value;
      _$sessionsAtom.reportChanged();
    }, _$sessionsAtom, name: '${_$sessionsAtom.name}_set');
  }

  final _$ArchiveStoreBaseActionController =
      ActionController(name: 'ArchiveStoreBase');

  @override
  void init() {
    final _$actionInfo = _$ArchiveStoreBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$ArchiveStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
