// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PingResult _$_$_PingResultFromJson(Map<String, dynamic> json) {
  return _$_PingResult(
    id: json['id'] as int,
    host: json['host'] == null
        ? null
        : PingHost.fromJson(json['host'] as Map<String, dynamic>),
    settings: json['settings'] == null
        ? null
        : PingSettings.fromJson(json['settings'] as Map<String, dynamic>),
    startTime: json['startTime'] == null
        ? null
        : DateTime.parse(json['startTime'] as String),
    duration: json['duration'] == null
        ? null
        : Duration(microseconds: json['duration'] as int),
    values: (json['values'] as List)?.map((e) => e as int)?.toList(),
    stats: json['stats'] == null
        ? null
        : PingStats.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PingResultToJson(_$_PingResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host?.toJson(),
      'settings': instance.settings?.toJson(),
      'startTime': instance.startTime?.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
      'values': instance.values,
      'stats': instance.stats?.toJson(),
    };

_$_PingHost _$_$_PingHostFromJson(Map<String, dynamic> json) {
  return _$_PingHost(
    name: json['name'] as String,
    ip: json['ip'] as String,
  );
}

Map<String, dynamic> _$_$_PingHostToJson(_$_PingHost instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ip': instance.ip,
    };

_$_PingStats _$_$_PingStatsFromJson(Map<String, dynamic> json) {
  return _$_PingStats(
    min: json['min'] as int,
    max: json['max'] as int,
    mean: json['mean'] as int,
  );
}

Map<String, dynamic> _$_$_PingStatsToJson(_$_PingStats instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'mean': instance.mean,
    };
