// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HostStats _$_$_HostStatsFromJson(Map<String, dynamic> json) {
  return _$_HostStats(
    host: json['host'] as String,
    pingCount: json['pingCount'] as int,
    pingTime: json['pingTime'] == null
        ? null
        : DateTime.parse(json['pingTime'] as String),
  );
}

Map<String, dynamic> _$_$_HostStatsToJson(_$_HostStats instance) =>
    <String, dynamic>{
      'host': instance.host,
      'pingCount': instance.pingCount,
      'pingTime': instance.pingTime?.toIso8601String(),
    };
