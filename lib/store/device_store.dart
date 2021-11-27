import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';

import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/service/notifications_manager.dart';
import 'package:pinger/service/vibration.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';

part 'device_store.g.dart';

@singleton
class DeviceStore extends DeviceStoreBase with _$DeviceStore {
  final LifecycleNotifier _lifecycleNotifier;
  final Connectivity _connectivity;
  final Location _location;
  final Vibration _vibration;
  final NotificationsManager _notificationsManager;
  final SettingsStore _settingsStore;
  final PermissionStore _notificationPermissionStore;

  DeviceStore(
    this._lifecycleNotifier,
    this._connectivity,
    this._location,
    this._vibration,
    this._notificationsManager,
    this._settingsStore,
    @Named(PermissionStore.notification) this._notificationPermissionStore,
  );
}

abstract class DeviceStoreBase with Store {
  LifecycleNotifier get _lifecycleNotifier;
  Connectivity get _connectivity;
  Location get _location;
  Vibration get _vibration;
  NotificationsManager get _notificationsManager;
  SettingsStore get _settingsStore;
  PermissionStore get _notificationPermissionStore;

  PingSession? _lastSession;

  @observable
  bool? isNetworkEnabled;

  @action
  Future<void> init() async {
    _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    _lifecycleNotifier.register(LifecycleAware(onResumed: _syncNetworkStatus));
    await _syncNetworkStatus();
    await _location.changeSettings(accuracy: LocationAccuracy.balanced);
  }

  Future<void> _syncNetworkStatus() async {
    await _connectivity.checkConnectivity().then(_onConnectivityChanged);
  }

  void _onConnectivityChanged(ConnectivityResult result) {
    final isEnabled = result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
    if (isNetworkEnabled != isEnabled) isNetworkEnabled = isEnabled;
  }

  @action
  Future<GeoPosition> getCurrentPosition() async {
    final result = await _location.getLocation();
    return GeoPosition(lat: result.latitude!, lon: result.longitude!);
  }

  void updateNotification(PingSession? session) {
    final showNotification = _notificationPermissionStore.canAccessService &&
        _settingsStore.userSettings!.showSystemNotification;
    if (session != _lastSession) {
      if (showNotification && session != null) {
        _notificationsManager.show(session);
      } else {
        _notificationsManager.clear();
      }
      _lastSession = session;
    }
  }

  void triggerFeedback() => _vibration.feedback();
}
