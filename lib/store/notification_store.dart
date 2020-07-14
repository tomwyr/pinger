import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/lifecycle_notifier.dart';
import 'package:pinger/utils/notification_messages.dart';

part 'notification_store.g.dart';

@singleton
class NotificationStore extends NotificationStoreBase with _$NotificationStore {
  final LifecycleNotifier _lifecycleNotifier;
  final FlutterLocalNotificationsPlugin _localNotifications;
  final NotificationMessages _messages;
  final SettingsStore _settingsStore;
  final PingStore _pingStore;

  NotificationStore(
    this._lifecycleNotifier,
    this._localNotifications,
    this._messages,
    this._settingsStore,
    this._pingStore,
  );
}

abstract class NotificationStoreBase with Store {
  LifecycleNotifier get _lifecycleNotifier;
  FlutterLocalNotificationsPlugin get _localNotifications;
  NotificationMessages get _messages;
  SettingsStore get _settingsStore;
  PingStore get _pingStore;

  @observable
  bool hasPermission = false;

  bool _isCheckingPermission = false;
  Future<void> _currentNotification;
  PingSession _lastSession;

  @action
  void init() {
    _lifecycleNotifier.register(LifecycleAware(
      onResumed: _updateNotificatioPermission,
    ));
    _updateNotificatioPermission();
    autorun((_) => _verifyCanShowNotification());
    autorun((_) => _showNotificationIfPinging());
  }

  @action
  Future<void> _updateNotificatioPermission() async {
    var status = hasPermission;
    switch (await Permission.notification.status) {
      case PermissionStatus.granted:
        status = true;
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
        status = false;
        break;
      case PermissionStatus.undetermined:
        status = null;
        break;
    }
    if (status != hasPermission) hasPermission = status;
  }

  void _verifyCanShowNotification() async {
    if (_settingsStore.userSettings.showSystemNotification) {
      if (hasPermission == null && !_isCheckingPermission) {
        _isCheckingPermission = true;
        await Permission.notification.request();
        await _updateNotificatioPermission();
        _isCheckingPermission = false;
      }
    }
  }

  void _showNotificationIfPinging() async {
    final session = _pingStore.currentSession;
    final showNotification = hasPermission == true &&
        _settingsStore.userSettings.showSystemNotification;
    if (session != _lastSession) {
      if (showNotification && session != null) {
        _showSessionNotification(session);
      } else {
        _clearNotification();
      }
      _lastSession = session;
    }
  }

  void _showSessionNotification(PingSession session) {
    switch (session.status) {
      case PingStatus.sessionStarted:
        _showNotification(
          _messages.startedTitle,
          session.values.isNotEmpty
              ? session.values.last != null
                  ? _messages.startedBody(session.values.last)
                  : "-"
              : "",
        );
        break;
      case PingStatus.sessionPaused:
        _showNotification(
          _messages.pausedTitle,
          _messages.pausedBody(
            session.values.length,
            session.settings.count,
          ),
        );
        break;
      case PingStatus.sessionDone:
        _showNotification(
          _messages.doneTitle,
          session.stats != null
              ? _messages.doneBody(
                  session.stats.min,
                  session.stats.mean,
                  session.stats.max,
                )
              : "",
        );
        break;
      case PingStatus.initial:
      case PingStatus.quickCheckDone:
      case PingStatus.quickCheckStarted:
        _clearNotification();
        break;
    }
  }

  void _showNotification(String title, String body) {
    final details = NotificationDetails(
      AndroidNotificationDetails(
        'pingerChannelId',
        'pingerChannelName',
        'Pinger notifications channel',
        playSound: false,
        enableVibration: false,
      ),
      IOSNotificationDetails(
        presentAlert: false,
        presentSound: false,
      ),
    );
    _currentNotification = _localNotifications.show(0, title, body, details);
  }

  void _clearNotification() {
    if (_currentNotification != null) {
      _localNotifications.cancel(0);
      _currentNotification = null;
    }
  }
}
