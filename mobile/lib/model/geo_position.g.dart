// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeoPositionImpl _$$GeoPositionImplFromJson(Map<String, dynamic> json) =>
    _$GeoPositionImpl(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$$GeoPositionImplToJson(_$GeoPositionImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
