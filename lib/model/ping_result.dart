import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/user_settings.dart';

part 'ping_result.freezed.dart';
part 'ping_result.g.dart';

@freezed
abstract class PingResult with _$PingResult {
  factory PingResult({
    int id,
    @required String host,
    @required PingSettings settings,
    @required DateTime startTime,
    @required Duration duration,
    @required List<int> values,
    @required PingStats stats,
  }) = _PingResult;

  factory PingResult.fromJson(Map<String, dynamic> json) =>
      _$PingResultFromJson(json);
}

@freezed
abstract class PingStats with _$PingStats {
  const factory PingStats({
    @required int min,
    @required int max,
    @required int mean,
  }) = _PingStats;

  static PingStats fromValues(Iterable<int> values) {
    bool hasValue = false;
    int min = double.maxFinite.toInt();
    int max = 0;
    int sum = 0;
    values.where((it) => it != null).forEach((it) {
      if (!hasValue) hasValue = true;
      sum += it;
      min = math.min(min, it);
      max = math.max(max, it);
    });
    if (!hasValue) return null;
    return PingStats(
      min: min.toInt(),
      max: max.toInt(),
      mean: sum ~/ values.length,
    );
  }

  factory PingStats.fromJson(Map<String, dynamic> json) =>
      _$PingStatsFromJson(json);
}
