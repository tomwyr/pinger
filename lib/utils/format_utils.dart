import 'package:intl/intl.dart';

class FormatUtils {
  static String getSinceNowLabel(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays >= 7) return '${diff.inDays ~/ 7} w';
    if (diff.inHours >= 24) return '${diff.inHours ~/ 24} d';
    if (diff.inMinutes >= 60) return '${diff.inMinutes ~/ 60} h';
    if (diff.inSeconds >= 60) return '${diff.inSeconds ~/ 60} m';
    return '${diff.inSeconds} s';
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
}
