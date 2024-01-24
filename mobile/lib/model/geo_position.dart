import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_position.freezed.dart';
part 'geo_position.g.dart';

@freezed
class GeoPosition with _$GeoPosition {
  factory GeoPosition({
    required double lat,
    required double lon,
  }) = _GeoPosition;

  factory GeoPosition.fromJson(Map<String, dynamic> json) => _$GeoPositionFromJson(json);
}
