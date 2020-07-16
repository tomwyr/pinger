import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';

part 'permission_store.g.dart';

class PermissionStore extends PermissionStoreBase with _$PermissionStore {
  PermissionStore(
    this._lifecycleNotifier,
    this._permission,
    this._getSetting,
    this._updateSetting,
  );

  final LifecycleNotifier _lifecycleNotifier;
  final Permission _permission;
  final bool Function() _getSetting;
  final Future<void> Function(bool) _updateSetting;
}

abstract class PermissionStoreBase with Store, LifecycleAware {
  LifecycleNotifier get _lifecycleNotifier;
  Permission get _permission;
  bool Function() get _getSetting;
  Future<void> Function(bool) get _updateSetting;

  @observable
  bool didRejectSetting = false;

  @observable
  bool canAccessService = false;

  ReactionDisposer _reactionDisposer;

  @action
  Future<void> init() async {
    _lifecycleNotifier.register(this);
    await _checkAccessStatus();
    await _syncSettingState();
    _reactionDisposer = reaction(
      (_) => _getSetting(),
      _verifySettingStatus,
      fireImmediately: true,
    );
  }

  @override
  void onResumed() async {
    await _checkAccessStatus();
    await _syncSettingState();
  }

  @action
  Future<void> _syncSettingState() async {
    if (didRejectSetting && canAccessService) {
      didRejectSetting = false;
      await _updateSetting(true);
    } else if (_getSetting() && !canAccessService) {
      await _updateSetting(false);
    }
  }

  void dispose() {
    _reactionDisposer();
    _lifecycleNotifier.unregister(this);
  }

  @action
  Future<void> _verifySettingStatus(bool enabled) async {
    if (enabled && !canAccessService) {
      await _permission.request();
      await _checkAccessStatus();
      if (!canAccessService) {
        didRejectSetting = true;
        await _updateSetting(false);
      }
    }
  }

  @action
  Future<void> _checkAccessStatus() async {
    var status = await _permission.isGranted;
    if (_permission is PermissionWithService) {
      final isEnabled =
          await (_permission as PermissionWithService).serviceStatus.isEnabled;
      status = status && isEnabled;
    }
    if (status != canAccessService) canAccessService = status;
  }

  @action
  void notifyHandledRejection() => didRejectSetting = false;
}
