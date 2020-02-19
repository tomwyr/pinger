import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ping_session.freezed.dart';
part 'ping_session.g.dart';

@freezed
abstract class PingSession with _$PingSession {
  factory PingSession({
    @required String host,
    @required DateTime timestamp,
    @required PingResults results,
  }) = _PingSession;

  factory PingSession.fromJson(Map<String, dynamic> json) =>
      _$PingSessionFromJson(json);
}

@freezed
abstract class PingResults with _$PingResults {
  factory PingResults({
    @required List<double> values,
    @required double min,
    @required double max,
    @required double mean,
  }) = _PingResults;

  static PingResults fromValues(List<double> values) {
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
    return PingResults(
      values: values,
      min: min,
      max: max,
      mean: sum / values.length,
    );
  }

  factory PingResults.fromJson(Map<String, dynamic> json) =>
      _$PingResultsFromJson(json);
}
