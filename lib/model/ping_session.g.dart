// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PingHost _$_$_PingHostFromJson(Map<String, dynamic> json) {
  return _$_PingHost(
    name: json['name'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$_$_PingHostToJson(_$_PingHost instance) =>
    <String, dynamic>{
      'name': instance.name,
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
    min: (json['min'] as num)?.toDouble(),
    max: (json['max'] as num)?.toDouble(),
    mean: (json['mean'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_PingResultsToJson(_$_PingResults instance) =>
    <String, dynamic>{
      'values': instance.values,
      'min': instance.min,
      'max': instance.max,
      'mean': instance.mean,
    };
