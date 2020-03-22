import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/user_settings.dart';

part 'ping_result.freezed.dart';
part 'ping_result.g.dart';

@freezed
abstract class PingResult with _$PingResult {
  factory PingResult({
    int id,
    @required PingHost host,
    @required PingSettings settings,
    @required DateTime startTime,
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
  const factory PingStats({
    @required double min,
    @required double max,
    @required double mean,
  }) = _PingStats;

  static PingStats fromValues(List<double> values) {
    if (values?.isNotEmpty != true || values.every((it) => it == null))
      throw ArgumentError(
          "Ping values have to contain at least one non-null result.");
    double min = double.infinity;
    double max = double.negativeInfinity;
    double sum = 0.0;
    values.where((it) => it != null).forEach((it) {
      sum += it;
      min = math.min(min, it);
      max = math.max(max, it);
    });
    return PingStats(min: min, max: max, mean: sum / values.length);
  }

  factory PingStats.fromJson(Map<String, dynamic> json) =>
      _$PingStatsFromJson(json);
}
