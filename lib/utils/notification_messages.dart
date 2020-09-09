import 'package:pinger/generated/l10n.dart';

class NotificationMessages {
  String startedTitle(String host) => S.current.notificationStartedTitle(host);

  String startedBody(int last) => S.current.notificationStartedBody(last);

  String pausedTitle(String host) => S.current.notificationPausedTitle(host);

  String pausedBody(int length, String count) =>
      S.current.notificationPausedBody(length, count);

  String doneTitle(String host) => S.current.notificationDoneTitle(host);

  String doneBody(int min, int mean, int max) =>
      S.current.notificationDoneBody(min, mean, max);
}
