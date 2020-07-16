// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PermissionStore on PermissionStoreBase, Store {
  final _$didRejectSettingAtom =
      Atom(name: 'PermissionStoreBase.didRejectSetting');

  @override
  bool get didRejectSetting {
    _$didRejectSettingAtom.reportRead();
    return super.didRejectSetting;
  }

  @override
  set didRejectSetting(bool value) {
    _$didRejectSettingAtom.reportWrite(value, super.didRejectSetting, () {
      super.didRejectSetting = value;
    });
  }

  final _$canAccessServiceAtom =
      Atom(name: 'PermissionStoreBase.canAccessService');

  @override
  bool get canAccessService {
    _$canAccessServiceAtom.reportRead();
    return super.canAccessService;
  }

  @override
  set canAccessService(bool value) {
    _$canAccessServiceAtom.reportWrite(value, super.canAccessService, () {
      super.canAccessService = value;
    });
  }

  final _$initAsyncAction = AsyncAction('PermissionStoreBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$_syncSettingStateAsyncAction =
      AsyncAction('PermissionStoreBase._syncSettingState');

  @override
  Future<void> _syncSettingState() {
    return _$_syncSettingStateAsyncAction.run(() => super._syncSettingState());
  }

  final _$_verifySettingStatusAsyncAction =
      AsyncAction('PermissionStoreBase._verifySettingStatus');

  @override
  Future<void> _verifySettingStatus(bool enabled) {
    return _$_verifySettingStatusAsyncAction
        .run(() => super._verifySettingStatus(enabled));
  }

  final _$_checkAccessStatusAsyncAction =
      AsyncAction('PermissionStoreBase._checkAccessStatus');

  @override
  Future<void> _checkAccessStatus() {
    return _$_checkAccessStatusAsyncAction
        .run(() => super._checkAccessStatus());
  }

  final _$PermissionStoreBaseActionController =
      ActionController(name: 'PermissionStoreBase');

  @override
  void notifyHandledRejection() {
    final _$actionInfo = _$PermissionStoreBaseActionController.startAction(
        name: 'PermissionStoreBase.notifyHandledRejection');
    try {
      return super.notifyHandledRejection();
    } finally {
      _$PermissionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
didRejectSetting: ${didRejectSetting},
canAccessService: ${canAccessService}
    ''';
  }
}
