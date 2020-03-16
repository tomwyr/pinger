import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/user_settings.dart';

part 'ping_result.freezed.dart';
part 'ping_result.g.dart';

@freezed
abstract class PingResult with _$PingResult {
  factory PingResult({
    @required int id,
    @required PingHost host,
    @required PingSettings settings,
    @required DateTime timestamp,
    @required Duration duration,
    @required List<double> values,
  }) = _PingResult;

  @late
  PingStats get stats => PingStats.fromValues(values);

  factory PingResult.fromJson(Map<String, dynamic> json) =>
      _$PingResultFromJson(json);
}

@freezed
abstract class PingHost with _$PingHost {
  factory PingHost({
    @required String name,
    String ip,
  }) = _PingHost;

  factory PingHost.fromJson(Map<String, dynamic> json) =>
      _$PingHostFromJson(json);
}

@freezed
abstract class PingStats with _$PingStats {
  factory PingStats({
    @required double min,
    @required double max,
    @required double mean,
  }) = _PingStats;

  static PingStats fromValues(List<double> values) {
    if (values?.isNotEmpty != true)
      throw ArgumentError("Ping values cannot be null or empty");
    double min = double.infinity;
    double max = double.negativeInfinity;
    double sum = 0.0;
    values.forEach((it) {
      sum += it;
      min = math.min(min, it);
      max = math.max(max, it);
    });
    return PingStats(min: min, max: max, mean: sum / values.length);
  }

  factory PingStats.fromJson(Map<String, dynamic> json) =>
      _$PingStatsFromJson(json);
}
