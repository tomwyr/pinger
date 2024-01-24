// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalPingCountsImpl _$$GlobalPingCountsImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalPingCountsImpl(
      totalCount: json['totalCount'] as int,
      pingCounts: (json['pingCounts'] as List<dynamic>)
          .map((e) => PingCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GlobalPingCountsImplToJson(
        _$GlobalPingCountsImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'pingCounts': instance.pingCounts.map((e) => e.toJson()).toList(),
    };

_$PingCountImpl _$$PingCountImplFromJson(Map<String, dynamic> json) =>
    _$PingCountImpl(
      host: json['host'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$PingCountImplToJson(_$PingCountImpl instance) =>
    <String, dynamic>{
      'host': instance.host,
      'count': instance.count,
    };

_$GlobalHostResultsImpl _$$GlobalHostResultsImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalHostResultsImpl(
      totalCount: json['totalCount'] as int,
      valueResults:
          ValueResults.fromJson(json['valueResults'] as Map<String, dynamic>),
      locationResults: (json['locationResults'] as List<dynamic>)
          .map((e) => LocationResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GlobalHostResultsImplToJson(
        _$GlobalHostResultsImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'valueResults': instance.valueResults.toJson(),
      'locationResults':
          instance.locationResults.map((e) => e.toJson()).toList(),
    };

_$ValueResultsImpl _$$ValueResultsImplFromJson(Map<String, dynamic> json) =>
    _$ValueResultsImpl(
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

Map<String, dynamic> _$$ValueResultsImplToJson(_$ValueResultsImpl instance) =>
    <String, dynamic>{
      'min': instance.min.map((k, e) => MapEntry(k.toString(), e)),
      'mean': instance.mean.map((k, e) => MapEntry(k.toString(), e)),
      'max': instance.max.map((k, e) => MapEntry(k.toString(), e)),
    };

_$LocationResultsImpl _$$LocationResultsImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationResultsImpl(
      count: json['count'] as int,
      location: GeoPosition.fromJson(json['location'] as Map<String, dynamic>),
      stats: PingStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationResultsImplToJson(
        _$LocationResultsImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'location': instance.location.toJson(),
      'stats': instance.stats.toJson(),
    };

_$GlobalSessionResultImpl _$$GlobalSessionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalSessionResultImpl(
      count: json['count'] as int,
      host: json['host'] as String,
      stats: PingStats.fromJson(json['stats'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : GeoPosition.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GlobalSessionResultImplToJson(
        _$GlobalSessionResultImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'host': instance.host,
      'stats': instance.stats.toJson(),
      'location': instance.location?.toJson(),
    };
