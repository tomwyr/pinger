// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

/// @nodoc
class _$GeoPositionTearOff {
  const _$GeoPositionTearOff();

  _GeoPosition call({required double lat, required double lon}) {
    return _GeoPosition(
      lat: lat,
      lon: lon,
    );
  }

  GeoPosition fromJson(Map<String, Object?> json) {
    return GeoPosition.fromJson(json);
  }
}

/// @nodoc
const $GeoPosition = _$GeoPositionTearOff();

/// @nodoc
mixin _$GeoPosition {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPositionCopyWith<GeoPosition> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPositionCopyWith<$Res> {
  factory $GeoPositionCopyWith(GeoPosition value, $Res Function(GeoPosition) then) =
      _$GeoPositionCopyWithImpl<$Res>;
  $Res call({double lat, double lon});
}

/// @nodoc
class _$GeoPositionCopyWithImpl<$Res> implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._value, this._then);

  final GeoPosition _value;
  // ignore: unused_field
  final $Res Function(GeoPosition) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$GeoPositionCopyWith<$Res> implements $GeoPositionCopyWith<$Res> {
  factory _$GeoPositionCopyWith(_GeoPosition value, $Res Function(_GeoPosition) then) =
      __$GeoPositionCopyWithImpl<$Res>;
  @override
  $Res call({double lat, double lon});
}

/// @nodoc
class __$GeoPositionCopyWithImpl<$Res> extends _$GeoPositionCopyWithImpl<$Res>
    implements _$GeoPositionCopyWith<$Res> {
  __$GeoPositionCopyWithImpl(_GeoPosition _value, $Res Function(_GeoPosition) _then)
      : super(_value, (v) => _then(v as _GeoPosition));

  @override
  _GeoPosition get _value => super._value as _GeoPosition;

  @override
  $Res call({
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_GeoPosition(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: lon == freezed
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeoPosition implements _GeoPosition {
  _$_GeoPosition({required this.lat, required this.lon});

  factory _$_GeoPosition.fromJson(Map<String, dynamic> json) => _$$_GeoPositionFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _GeoPosition &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  _$GeoPositionCopyWith<_GeoPosition> get copyWith =>
      __$GeoPositionCopyWithImpl<_GeoPosition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeoPositionToJson(this);
  }
}

abstract class _GeoPosition implements GeoPosition {
  factory _GeoPosition({required double lat, required double lon}) = _$_GeoPosition;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) = _$_GeoPosition.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$GeoPositionCopyWith<_GeoPosition> get copyWith => throw _privateConstructorUsedError;
}
