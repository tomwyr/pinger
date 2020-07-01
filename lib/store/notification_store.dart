import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/utils/notification_messages.dart';

part 'notification_store.g.dart';

@singleton
class NotificationStore extends NotificationStoreBase with _$NotificationStore {
  final FlutterLocalNotificationsPlugin _localNotifications;
  final NotificationMessages _messages;
  final SettingsStore _settingsStore;
  final PingStore _pingStore;

  NotificationStore(
    this._localNotifications,
    this._messages,
    this._settingsStore,
    this._pingStore,
  );
}

abstract class NotificationStoreBase with Store {
  FlutterLocalNotificationsPlugin get _localNotifications;
  NotificationMessages get _messages;
  SettingsStore get _settingsStore;
  PingStore get _pingStore;

  Future<void> _currentNotification;
  bool _isSettingEnabled;
  bool _isCheckingPermission = false;

  @action
  void init() {
    autorun((_) {
      if (_settingsStore.userSettings == null) return;
      _checkPermissionIfGotEnabled();
      _showNotificationIfPinging();
    });
  }

  void _checkPermissionIfGotEnabled() async {
    if (!_isCheckingPermission) {
      final showNotification =
          _settingsStore.userSettings.showSystemNotification;
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
        await _settingsStore
            .updateSettings(_settingsStore.userSettings.copyWith(
          showSystemNotification: false,
        ));
      }
    }
  }

  void _showNotificationIfPinging() async {
    if (_pingStore.currentSession == null) return;
    if (!_isSettingEnabled) {
      _clearNotification();
    } else if (!_isCheckingPermission) {
      _showSessionNotification(_pingStore.currentSession);
    }
  }

  void _showSessionNotification(PingSession session) {
    switch (session.status) {
      case PingStatus.sessionStarted:
        _showNotification(
          _messages.startedTitle,
          session.values.isNotEmpty
              ? _messages.startedBody(session.values.last ?? "-")
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
