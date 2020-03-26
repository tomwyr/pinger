import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';

part 'notification_store.g.dart';

@singleton
class NotificationStore extends NotificationStoreBase with _$NotificationStore {
  final SettingsStore settingsStore;
  final PingStore pingStore;

  NotificationStore(this.settingsStore, this.pingStore);
}

abstract class NotificationStoreBase with Store {
  SettingsStore get settingsStore;
  PingStore get pingStore;

  Future<void> _currentNotification;
  FlutterLocalNotificationsPlugin _localNotifications;
  bool _isSettingEnabled;
  bool _isCheckingPermission = false;

  @action
  void init() {
    _localNotifications = FlutterLocalNotificationsPlugin()
      ..initialize(_getInitSettings());
    autorun((_) {
      if (settingsStore.userSettings == null) return;
      _checkPermissionIfGotEnabled();
      _showNotificationIfPinging();
    });
  }

  InitializationSettings _getInitSettings() {
    return InitializationSettings(
      AndroidInitializationSettings('ic_notification'),
      IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
  }

  void _checkPermissionIfGotEnabled() async {
    if (!_isCheckingPermission) {
      final showNotification =
          settingsStore.userSettings.showSystemNotification;
      if (showNotification && _isSettingEnabled == false) {
        _isCheckingPermission = true;
        await _checkNotificationPermission();
        _isCheckingPermission = false;
      }
      _isSettingEnabled = showNotification;
    }
  }

  Future<void> _checkNotificationPermission() async {
    if (Platform.isIOS) {
      final hasPermission = await _localNotifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          .requestPermissions(badge: true, alert: true, sound: true);
      if (!hasPermission) {
        await settingsStore.update(settingsStore.userSettings.copyWith(
          showSystemNotification: false,
        ));
      }
    }
  }

  void _showNotificationIfPinging() async {
    if (pingStore.currentSession == null) return;
    if (!_isSettingEnabled) {
      _clearNotification();
    } else if (!_isCheckingPermission) {
      final session = pingStore.currentSession;
      switch (session.status) {
        case PingStatus.sessionStarted:
          _showStartedNotification(session);
          break;
        case PingStatus.sessionPaused:
          _showPausedNotification(session);
          break;
        case PingStatus.sessionDone:
          _showDoneNotification(session);
          break;
        case PingStatus.initial:
        case PingStatus.quickCheckDone:
        case PingStatus.quickCheckStarted:
          _clearNotification();
          break;
      }
    }
  }

  void _showStartedNotification(PingSession session) {
    final body = session.values.isNotEmpty
        ? session.values.last != null
            ? "Last result: ${session.values.last.round()} ms"
            : "Last result: -"
        : "...";
    _showNotification("Ping started", body);
  }

  void _showPausedNotification(PingSession session) {
    final body = "Progress: ${session.values.length}/${session.settings.count}";
    _showNotification("Ping paused", body);
  }

  void _showDoneNotification(PingSession session) {
    final body = session.stats != null
        ? "Min: ${session.stats.min.round()} ms | Mean: ${session.stats.mean.round()} ms | Max: ${session.stats.max.round()} ms"
        : "";
    _showNotification("Ping done", body);
  }

  void _showNotification(String title, String body) {
    final details = NotificationDetails(
      AndroidNotificationDetails(
        'pingerChannelId',
        'pingerChannelName',
        'Pinger notifications channel',
      ),
      IOSNotificationDetails(),
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
