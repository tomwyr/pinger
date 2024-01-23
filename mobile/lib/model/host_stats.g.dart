// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostStatsImpl _$$HostStatsImplFromJson(Map<String, dynamic> json) =>
    _$HostStatsImpl(
      host: json['host'] as String,
      pingCount: json['pingCount'] as int,
      pingTime: DateTime.parse(json['pingTime'] as String),
    );

Map<String, dynamic> _$$HostStatsImplToJson(_$HostStatsImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'pingCount': instance.pingCount,
      'pingTime': instance.pingTime.toIso8601String(),
    };
