// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PingHost _$_$_PingHostFromJson(Map<String, dynamic> json) {
  return _$_PingHost(
    name: json['name'] as String,
    ip: json['ip'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$_$_PingHostToJson(_$_PingHost instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ip': instance.ip,
      'avatarUrl': instance.avatarUrl,
    };

_$_PingSession _$_$_PingSessionFromJson(Map<String, dynamic> json) {
  return _$_PingSession(
    id: json['id'] as int,
    host: json['host'] == null
        ? null
        : PingHost.fromJson(json['host'] as Map<String, dynamic>),
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    duration: json['duration'] == null
        ? null
        : Duration(microseconds: json['duration'] as int),
    results: json['results'] == null
        ? null
        : PingResults.fromJson(json['results'] as Map<String, dynamic>),
    settings: json['settings'] == null
        ? null
        : PingSettings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PingSessionToJson(_$_PingSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'timestamp': instance.timestamp?.toIso8601String(),
      'duration': instance.duration?.inMicroseconds,
      'results': instance.results,
      'settings': instance.settings,
    };

_$_PingResults _$_$_PingResultsFromJson(Map<String, dynamic> json) {
  return _$_PingResults(
    values:
        (json['values'] as List)?.map((e) => (e as num)?.toDouble())?.toList(),
    stats: json['stats'] == null
        ? null
        : PingStats.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PingResultsToJson(_$_PingResults instance) =>
    <String, dynamic>{
      'values': instance.values,
      'stats': instance.stats,
    };

_$_PingStats _$_$_PingStatsFromJson(Map<String, dynamic> json) {
  return _$_PingStats(
    min: (json['min'] as num)?.toDouble(),
    max: (json['max'] as num)?.toDouble(),
    mean: (json['mean'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PingStatsToJson(_$_PingStats instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'mean': instance.mean,
    };
