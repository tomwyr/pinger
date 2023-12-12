// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeoPosition _$GeoPositionFromJson(Map<String, dynamic> json) {
  return _GeoPosition.fromJson(json);
}

/// @nodoc
mixin _$GeoPosition {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeoPositionCopyWith<GeoPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPositionCopyWith<$Res> {
  factory $GeoPositionCopyWith(
          GeoPosition value, $Res Function(GeoPosition) then) =
      _$GeoPositionCopyWithImpl<$Res, GeoPosition>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$GeoPositionCopyWithImpl<$Res, $Val extends GeoPosition>
    implements $GeoPositionCopyWith<$Res> {
  _$GeoPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoPositionImplCopyWith<$Res>
    implements $GeoPositionCopyWith<$Res> {
  factory _$$GeoPositionImplCopyWith(
          _$GeoPositionImpl value, $Res Function(_$GeoPositionImpl) then) =
      __$$GeoPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$GeoPositionImplCopyWithImpl<$Res>
    extends _$GeoPositionCopyWithImpl<$Res, _$GeoPositionImpl>
    implements _$$GeoPositionImplCopyWith<$Res> {
  __$$GeoPositionImplCopyWithImpl(
      _$GeoPositionImpl _value, $Res Function(_$GeoPositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$GeoPositionImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeoPositionImpl implements _GeoPosition {
  _$GeoPositionImpl({required this.lat, required this.lon});

  factory _$GeoPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeoPositionImplFromJson(json);

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
            other is _$GeoPositionImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoPositionImplCopyWith<_$GeoPositionImpl> get copyWith =>
      __$$GeoPositionImplCopyWithImpl<_$GeoPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeoPositionImplToJson(
      this,
    );
  }
}

abstract class _GeoPosition implements GeoPosition {
  factory _GeoPosition({required final double lat, required final double lon}) =
      _$GeoPositionImpl;

  factory _GeoPosition.fromJson(Map<String, dynamic> json) =
      _$GeoPositionImpl.fromJson;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$GeoPositionImplCopyWith<_$GeoPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
