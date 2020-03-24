// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
