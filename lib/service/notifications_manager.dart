import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/utils/format_utils.dart';
import 'package:pinger/utils/notification_messages.dart';

@injectable
class NotificationsManager {
  final FlutterLocalNotificationsPlugin _localNotifications;
  final NotificationMessages _messages;

  Future<void> _currentNotification;

  NotificationsManager(this._localNotifications, this._messages);

  void show(PingSession session) {
    switch (session.status) {
      case PingStatus.sessionStarted:
        _showNotification(
          _messages.startedTitle(session.host),
          session.values.isNotEmpty
              ? session.values.last != null
                  ? _messages.startedBody(session.values.last)
                  : "-"
              : "",
        );
        break;
      case PingStatus.sessionPaused:
        _showNotification(
          _messages.pausedTitle(session.host),
          _messages.pausedBody(
            session.values.length,
            FormatUtils.getCountLabel(session.settings.count),
          ),
        );
        break;
      case PingStatus.sessionDone:
        _showNotification(
          _messages.doneTitle(session.host),
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
        clear();
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

  void clear() {
    if (_currentNotification != null) {
      _localNotifications.cancel(0);
      _currentNotification = null;
    }
  }
}
