// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

mixin _$GeoPosition {
  double get lat;
  double get lon;

  GeoPosition copyWith({double lat, double lon});

  Map<String, dynamic> toJson();
}

class _$GeoPositionTearOff {
  const _$GeoPositionTearOff();

  _GeoPosition call({@required double lat, @required double lon}) {
    return _GeoPosition(
      lat: lat,
      lon: lon,
    );
  }
}

const $GeoPosition = _$GeoPositionTearOff();

@JsonSerializable()
class _$_GeoPosition implements _GeoPosition {
  _$_GeoPosition({@required this.lat, @required this.lon})
      : assert(lat != null),
        assert(lon != null);

  factory _$_GeoPosition.fromJson(Map<String, dynamic> json) =>
      _$_$_GeoPositionFromJson(json);

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'GeoPosition(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GeoPosition &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  _$_GeoPosition copyWith({
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _$_GeoPosition(
      lat: lat == freezed ? this.lat : lat as double,
      lon: lon == freezed ? this.lon : lon as double,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GeoPositionToJson(this);
  }
}

abstract class _GeoPosition implements GeoPosition {
  factory _GeoPosition({@required double lat, @required double lon}) =
      _$_GeoPosition;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) =
      _$_GeoPosition.fromJson;

  @override
  double get lat;
  @override
  double get lon;

  @override
  _GeoPosition copyWith({double lat, double lon});
}
