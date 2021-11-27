// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GlobalPingCounts _$$_GlobalPingCountsFromJson(Map<String, dynamic> json) => _$_GlobalPingCounts(
      totalCount: json['totalCount'] as int,
      pingCounts: (json['pingCounts'] as List<dynamic>)
          .map((e) => PingCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GlobalPingCountsToJson(_$_GlobalPingCounts instance) => <String, dynamic>{
      'totalCount': instance.totalCount,
      'pingCounts': instance.pingCounts.map((e) => e.toJson()).toList(),
    };

_$_PingCount _$$_PingCountFromJson(Map<String, dynamic> json) => _$_PingCount(
      host: json['host'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_PingCountToJson(_$_PingCount instance) => <String, dynamic>{
      'host': instance.host,
      'count': instance.count,
    };

_$_GlobalHostResults _$$_GlobalHostResultsFromJson(Map<String, dynamic> json) =>
    _$_GlobalHostResults(
      totalCount: json['totalCount'] as int,
      valueResults: ValueResults.fromJson(json['valueResults'] as Map<String, dynamic>),
      locationResults: (json['locationResults'] as List<dynamic>)
          .map((e) => LocationResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GlobalHostResultsToJson(_$_GlobalHostResults instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'valueResults': instance.valueResults.toJson(),
      'locationResults': instance.locationResults.map((e) => e.toJson()).toList(),
    };

_$_ValueResults _$$_ValueResultsFromJson(Map<String, dynamic> json) => _$_ValueResults(
      min: (json['min'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as int),
      ),
      mean: (json['mean'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as int),
      ),
      max: (json['max'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as int),
      ),
    );

Map<String, dynamic> _$$_ValueResultsToJson(_$_ValueResults instance) => <String, dynamic>{
      'min': instance.min.map((k, e) => MapEntry(k.toString(), e)),
      'mean': instance.mean.map((k, e) => MapEntry(k.toString(), e)),
      'max': instance.max.map((k, e) => MapEntry(k.toString(), e)),
    };

_$_LocationResults _$$_LocationResultsFromJson(Map<String, dynamic> json) => _$_LocationResults(
      count: json['count'] as int,
      location: GeoPosition.fromJson(json['location'] as Map<String, dynamic>),
      stats: PingStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LocationResultsToJson(_$_LocationResults instance) => <String, dynamic>{
      'count': instance.count,
      'location': instance.location.toJson(),
      'stats': instance.stats.toJson(),
    };

_$_GlobalSessionResult _$$_GlobalSessionResultFromJson(Map<String, dynamic> json) =>
    _$_GlobalSessionResult(
      count: json['count'] as int,
      host: json['host'] as String,
      stats: PingStats.fromJson(json['stats'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : GeoPosition.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GlobalSessionResultToJson(_$_GlobalSessionResult instance) =>
    <String, dynamic>{
      'count': instance.count,
      'host': instance.host,
      'stats': instance.stats.toJson(),
      'location': instance.location?.toJson(),
    };
