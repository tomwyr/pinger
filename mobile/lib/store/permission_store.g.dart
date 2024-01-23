// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PermissionStore on PermissionStoreBase, Store {
  late final _$didRejectSettingAtom =
      Atom(name: 'PermissionStoreBase.didRejectSetting', context: context);

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

  late final _$canAccessServiceAtom =
      Atom(name: 'PermissionStoreBase.canAccessService', context: context);

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

  late final _$initAsyncAction =
      AsyncAction('PermissionStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_syncSettingStateAsyncAction =
      AsyncAction('PermissionStoreBase._syncSettingState', context: context);

  @override
  Future<void> _syncSettingState() {
    return _$_syncSettingStateAsyncAction.run(() => super._syncSettingState());
  }

  late final _$_verifySettingStatusAsyncAction =
      AsyncAction('PermissionStoreBase._verifySettingStatus', context: context);

  @override
  Future<void> _verifySettingStatus(bool? enabled) {
    return _$_verifySettingStatusAsyncAction
        .run(() => super._verifySettingStatus(enabled));
  }

  late final _$_checkAccessStatusAsyncAction =
      AsyncAction('PermissionStoreBase._checkAccessStatus', context: context);

  @override
  Future<void> _checkAccessStatus() {
    return _$_checkAccessStatusAsyncAction
        .run(() => super._checkAccessStatus());
  }

  late final _$PermissionStoreBaseActionController =
      ActionController(name: 'PermissionStoreBase', context: context);

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
