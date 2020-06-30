import 'package:pinger/generated/l10n.dart';

class NotificationMessages {
  String get startedTitle => S.current.notificationStartedTitle;

  String startedBody(int last) => S.current.notificationStartedBody(last);

  String get pausedTitle => S.current.notificationPausedTitle;

  String pausedBody(int length, int count) =>
      S.current.notificationPausedBody(length, count);

  String get doneTitle => S.current.notificationDoneTitle;

  String doneBody(int min, int mean, int max) =>
      S.current.notificationDoneBody(min, mean, max);
}
