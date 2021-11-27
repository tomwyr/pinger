import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pinger/model/geo_position.dart';
import 'package:pinger/model/ping_result.dart';

part 'ping_global.freezed.dart';
part 'ping_global.g.dart';

@freezed
class GlobalPingCounts with _$GlobalPingCounts {
  factory GlobalPingCounts({
    required int totalCount,
    required List<PingCount> pingCounts,
  }) = _GlobalPingCounts;

  factory GlobalPingCounts.fromJson(Map<String, dynamic> json) => _$GlobalPingCountsFromJson(json);

  factory GlobalPingCounts.empty() => GlobalPingCounts(totalCount: 0, pingCounts: []);
}

@freezed
class PingCount with _$PingCount {
  factory PingCount({
    required String host,
    required int count,
  }) = _PingCount;

  factory PingCount.fromJson(Map<String, dynamic> json) => _$PingCountFromJson(json);
}

@freezed
class GlobalHostResults with _$GlobalHostResults {
  factory GlobalHostResults({
    required int totalCount,
    required ValueResults valueResults,
    required List<LocationResults> locationResults,
  }) = _GlobalHostResults;

  factory GlobalHostResults.fromJson(Map<String, dynamic> json) =>
      _$GlobalHostResultsFromJson(json);

  factory GlobalHostResults.empty() => GlobalHostResults(
        totalCount: 0,
        valueResults: ValueResults(min: {}, mean: {}, max: {}),
        locationResults: [],
      );
}

@freezed
class ValueResults with _$ValueResults {
  factory ValueResults({
    required Map<int, int> min,
    required Map<int, int> mean,
    required Map<int, int> max,
  }) = _ValueResults;

  factory ValueResults.fromJson(Map<String, dynamic> json) => _$ValueResultsFromJson(json);
}

@freezed
class LocationResults with _$LocationResults {
  factory LocationResults({
    required int count,
    required GeoPosition location,
    required PingStats stats,
  }) = _LocationResults;

  factory LocationResults.fromJson(Map<String, dynamic> json) => _$LocationResultsFromJson(json);
}

@freezed
class GlobalSessionResult with _$GlobalSessionResult {
  factory GlobalSessionResult({
    required int count,
    required String host,
    required PingStats stats,
    GeoPosition? location,
  }) = _GlobalSessionResult;

  factory GlobalSessionResult.fromJson(Map<String, dynamic> json) =>
      _$GlobalSessionResultFromJson(json);
}
