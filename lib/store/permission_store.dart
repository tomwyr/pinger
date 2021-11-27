import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';

part 'permission_store.g.dart';

abstract class PermissionStore extends PermissionStoreBase
    with _$PermissionStore {
  PermissionStore(
    this._settingsStore,
    this._lifecycleNotifier,
  );

  static const location = 'location';
  static const notification = 'notification';

  final SettingsStore _settingsStore;
  final LifecycleNotifier _lifecycleNotifier;
}

@Named(PermissionStore.notification)
@Singleton(as: PermissionStore)
class NotificationPermissionStore extends PermissionStore {
  NotificationPermissionStore(
    SettingsStore settingsStore,
    LifecycleNotifier lifecycleNotifier,
  ) : super(settingsStore, lifecycleNotifier);

  @override
  Permission get _permission => Permission.notification;

  @override
  bool? _getSetting() => _settingsStore.userSettings!.showSystemNotification;

  @override
  Future<void> _updateSetting(bool value) async {
    await _settingsStore.updateSettings(
      _settingsStore.userSettings!.copyWith(showSystemNotification: value),
    );
  }
}

@Named(PermissionStore.location)
@Singleton(as: PermissionStore)
class LocationPermissionStore extends PermissionStore {
  LocationPermissionStore(
    SettingsStore settingsStore,
    LifecycleNotifier lifecycleNotifier,
  ) : super(settingsStore, lifecycleNotifier);

  @override
  Permission get _permission => Permission.locationWhenInUse;

  @override
  bool? _getSetting() =>
      _settingsStore.userSettings!.shareSettings.attachLocation;

  @override
  Future<void> _updateSetting(bool value) async {
    await _settingsStore.updateSettings(
      _settingsStore.userSettings!.copyWith
          .shareSettings(attachLocation: value),
    );
  }
}

abstract class PermissionStoreBase with Store, LifecycleAware {
  LifecycleNotifier get _lifecycleNotifier;
  Permission get _permission;
  bool? _getSetting();
  Future<void> _updateSetting(bool value);

  @observable
  bool didRejectSetting = false;

  @observable
  bool canAccessService = false;

  late ReactionDisposer _reactionDisposer;

  @action
  Future<void> init() async {
    _lifecycleNotifier.register(this);
    await _checkAccessStatus();
    await _syncSettingState();
    _reactionDisposer = reaction<bool?>(
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
    } else if (_getSetting()! && !canAccessService) {
      await _updateSetting(false);
    }
  }

  void dispose() {
    _reactionDisposer();
    _lifecycleNotifier.unregister(this);
  }

  @action
  Future<void> _verifySettingStatus(bool? enabled) async {
    if (enabled! && !canAccessService) {
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
