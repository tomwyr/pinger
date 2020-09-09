import 'package:intl/intl.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';

class FormatUtils {
  static String getSinceNowLabel(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays >= 7)
      return S.current.weeksSinceNow(diff.inDays ~/ 7);
    else if (diff.inHours >= 24)
      return S.current.daysSinceNow(diff.inHours ~/ 24);
    else if (diff.inMinutes >= 60)
      return S.current.hoursSinceNow(diff.inMinutes ~/ 60);
    else if (diff.inSeconds >= 60)
      return S.current.minutesSinceNow(diff.inSeconds ~/ 60);
    else
      return S.current.secondsSinceNow(diff.inSeconds);
  }

  static String getDurationLabel(Duration duration) {
    final min = duration.inMinutes;
    final sec = duration.inSeconds - min * 60;
    return "$min:${sec.toString().padLeft(2, '0')}";
  }

  static String getTimestampLabel(DateTime timestamp, {bool showTime = false}) {
    var formatter = DateFormat.MMMd();
    if (showTime) formatter = formatter.add_Hm();
    return formatter.format(timestamp);
  }

  static String getCountLabel(NumSetting setting) {
    return setting.when(
      finite: (it) => it.toString(),
      infinite: () => R.symbols.infty,
    );
  }
}
