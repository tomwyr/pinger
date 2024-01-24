// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PingResultImpl _$$PingResultImplFromJson(Map<String, dynamic> json) =>
    _$PingResultImpl(
      id: json['id'] as int?,
      host: json['host'] as String,
      settings: PingSettings.fromJson(json['settings'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      duration: Duration(microseconds: json['duration'] as int),
      values: (json['values'] as List<dynamic>).map((e) => e as int?).toList(),
      stats: PingStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PingResultImplToJson(_$PingResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host,
      'settings': instance.settings.toJson(),
      'startTime': instance.startTime.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'values': instance.values,
      'stats': instance.stats.toJson(),
    };

_$PingStatsImpl _$$PingStatsImplFromJson(Map<String, dynamic> json) =>
    _$PingStatsImpl(
      min: json['min'] as int,
      max: json['max'] as int,
      mean: json['mean'] as int,
    );

Map<String, dynamic> _$$PingStatsImplToJson(_$PingStatsImpl instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'mean': instance.mean,
    };
