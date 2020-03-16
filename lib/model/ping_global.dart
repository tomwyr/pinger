import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pinger/model/ping_result.dart';

part 'ping_global.freezed.dart';
part 'ping_global.g.dart';

@freezed
abstract class PingGlobalResults with _$PingGlobalResults {
  factory PingGlobalResults({
    @required List<PingGeoStats> geoStats,
    @required PingGroupStats groupStats,
  }) = _PingGlobalResults;

  factory PingGlobalResults.fromJson(Map<String, dynamic> json) =>
      _$PingGlobalResultsFromJson(json);
}

@freezed
abstract class PingGeoStats with _$PingGeoStats {
  factory PingGeoStats({
    @required GeoPosition position,
    @required PingStats stats,
  }) = _PingGeoStats;

  factory PingGeoStats.fromJson(Map<String, dynamic> json) =>
      _$PingGeoStatsFromJson(json);
}

@freezed
abstract class GeoPosition with _$GeoPosition {
  factory GeoPosition({
    @required double lat,
    @required double lon,
  }) = _GeoPosition;

  factory GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$GeoPositionFromJson(json);
}

@freezed
abstract class PingGroupStats with _$PingGroupStats {
  factory PingGroupStats({
    @required List<PingGroup> min,
    @required List<PingGroup> mean,
    @required List<PingGroup> max,
  }) = _PingGlobalStats;

  factory PingGroupStats.fromJson(Map<String, dynamic> json) =>
      _$PingGroupStatsFromJson(json);
}

@freezed
abstract class PingGroup with _$PingGroup {
  factory PingGroup({
    @required double ping,
    @required double percentage,
  }) = _PingGroup;

  factory PingGroup.fromJson(Map<String, dynamic> json) =>
      _$PingGroupFromJson(json);
}
