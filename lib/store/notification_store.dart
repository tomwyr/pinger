import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/service/notifications_manager.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';

part 'notification_store.g.dart';

@singleton
class NotificationStore extends NotificationStoreBase with _$NotificationStore {
  final LifecycleNotifier _lifecycleNotifier;
  final NotificationsManager _notificationsManager;
  final SettingsStore _settingsStore;
  final PingStore _pingStore;

  NotificationStore(
    this._lifecycleNotifier,
    this._notificationsManager,
    this._settingsStore,
    this._pingStore,
  );
}

abstract class NotificationStoreBase with Store {
  LifecycleNotifier get _lifecycleNotifier;
  NotificationsManager get _notificationsManager;
  SettingsStore get _settingsStore;
  PingStore get _pingStore;

  PermissionStore _permissionStore;
  PingSession _lastSession;

  PermissionStore get permissionStore => _permissionStore;

  @action
  Future<void> init() async {
    _permissionStore = PermissionStore(
      _lifecycleNotifier,
      Permission.notification,
      () => _settingsStore.userSettings.showSystemNotification,
      (it) => _settingsStore.updateSettings(
        _settingsStore.userSettings.copyWith(showSystemNotification: it),
      ),
    );
    await _permissionStore.init();
    autorun((_) => _showNotificationIfPinging());
  }

  void _showNotificationIfPinging() {
    final session = _pingStore.currentSession;
    final showNotification = _permissionStore.canAccessService &&
        _settingsStore.userSettings.showSystemNotification;
    if (session != _lastSession) {
      if (showNotification && session != null) {
        _notificationsManager.show(session);
      } else {
        _notificationsManager.clear();
      }
      _lastSession = session;
    }
  }
}
