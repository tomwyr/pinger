// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
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

// ignore: unused_element
const $GeoPosition = _$GeoPositionTearOff();

mixin _$GeoPosition {
  double get lat;
  double get lon;

  Map<String, dynamic> toJson();
  $GeoPositionCopyWith<GeoPosition> get copyWith;
}

abstract class $GeoPositionCopyWith<$Res> {
  factory $GeoPositionCopyWith(
          GeoPosition value, $Res Function(GeoPosition) then) =
      _$GeoPositionCopyWithImpl<$Res>;
  $Res call({double lat, double lon});
}

class _$GeoPositionCopyWithImpl<$Res> implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._value, this._then);

  final GeoPosition _value;
  // ignore: unused_field
  final $Res Function(GeoPosition) _then;

  @override
  $Res call({
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

abstract class _$GeoPositionCopyWith<$Res>
    implements $GeoPositionCopyWith<$Res> {
  factory _$GeoPositionCopyWith(
          _GeoPosition value, $Res Function(_GeoPosition) then) =
      __$GeoPositionCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lon});
}

class __$GeoPositionCopyWithImpl<$Res> extends _$GeoPositionCopyWithImpl<$Res>
    implements _$GeoPositionCopyWith<$Res> {
  __$GeoPositionCopyWithImpl(
      _GeoPosition _value, $Res Function(_GeoPosition) _then)
      : super(_value, (v) => _then(v as _GeoPosition));

  @override
  _GeoPosition get _value => super._value as _GeoPosition;

  @override
  $Res call({
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(_GeoPosition(
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

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
  _$GeoPositionCopyWith<_GeoPosition> get copyWith =>
      __$GeoPositionCopyWithImpl<_GeoPosition>(this, _$identity);

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
  _$GeoPositionCopyWith<_GeoPosition> get copyWith;
}
