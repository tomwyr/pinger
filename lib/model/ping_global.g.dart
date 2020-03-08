// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PingGlobalResults _$_$_PingGlobalResultsFromJson(Map<String, dynamic> json) {
  return _$_PingGlobalResults(
    geoStats: (json['geoStats'] as List)
        ?.map((e) =>
            e == null ? null : PingGeoStats.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    groupStats: json['groupStats'] == null
        ? null
        : PingGroupStats.fromJson(json['groupStats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PingGlobalResultsToJson(
        _$_PingGlobalResults instance) =>
    <String, dynamic>{
      'geoStats': instance.geoStats,
      'groupStats': instance.groupStats,
    };

_$_PingGeoStats _$_$_PingGeoStatsFromJson(Map<String, dynamic> json) {
  return _$_PingGeoStats(
    position: json['position'] == null
        ? null
        : GeoPosition.fromJson(json['position'] as Map<String, dynamic>),
    stats: json['stats'] == null
        ? null
        : PingStats.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PingGeoStatsToJson(_$_PingGeoStats instance) =>
    <String, dynamic>{
      'position': instance.position,
      'stats': instance.stats,
    };

_$_GeoPosition _$_$_GeoPositionFromJson(Map<String, dynamic> json) {
  return _$_GeoPosition(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_GeoPositionToJson(_$_GeoPosition instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_PingGlobalStats _$_$_PingGlobalStatsFromJson(Map<String, dynamic> json) {
  return _$_PingGlobalStats(
    min: (json['min'] as List)
        ?.map((e) =>
            e == null ? null : PingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mean: (json['mean'] as List)
        ?.map((e) =>
            e == null ? null : PingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    max: (json['max'] as List)
        ?.map((e) =>
            e == null ? null : PingGroup.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PingGlobalStatsToJson(_$_PingGlobalStats instance) =>
    <String, dynamic>{
      'min': instance.min,
      'mean': instance.mean,
      'max': instance.max,
    };

_$_PingGroup _$_$_PingGroupFromJson(Map<String, dynamic> json) {
  return _$_PingGroup(
    ping: (json['ping'] as num)?.toDouble(),
    percentage: (json['percentage'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PingGroupToJson(_$_PingGroup instance) =>
    <String, dynamic>{
      'ping': instance.ping,
      'percentage': instance.percentage,
    };
