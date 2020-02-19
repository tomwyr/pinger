class FormatUtils {
  static String getSinceNowLabel(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inDays >= 7) return '${diff.inDays ~/ 7} w';
    if (diff.inHours >= 24) return '${diff.inHours ~/ 24} d';
    if (diff.inMinutes >= 60) return '${diff.inMinutes ~/ 60} h';
    if (diff.inSeconds >= 60) return '${diff.inSeconds ~/ 60} m';
    return '${diff.inSeconds} s';
  }
}
