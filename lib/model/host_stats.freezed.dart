// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'host_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostStats _$HostStatsFromJson(Map<String, dynamic> json) {
  return _HostStats.fromJson(json);
}

/// @nodoc
class _$HostStatsTearOff {
  const _$HostStatsTearOff();

  _HostStats call(
      {required String host,
      required int pingCount,
      required DateTime pingTime}) {
    return _HostStats(
      host: host,
      pingCount: pingCount,
      pingTime: pingTime,
    );
  }

  HostStats fromJson(Map<String, Object?> json) {
    return HostStats.fromJson(json);
  }
}

/// @nodoc
const $HostStats = _$HostStatsTearOff();

/// @nodoc
mixin _$HostStats {
  String get host => throw _privateConstructorUsedError;
  int get pingCount => throw _privateConstructorUsedError;
  DateTime get pingTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostStatsCopyWith<HostStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostStatsCopyWith<$Res> {
  factory $HostStatsCopyWith(HostStats value, $Res Function(HostStats) then) =
      _$HostStatsCopyWithImpl<$Res>;
  $Res call({String host, int pingCount, DateTime pingTime});
}

/// @nodoc
class _$HostStatsCopyWithImpl<$Res> implements $HostStatsCopyWith<$Res> {
  _$HostStatsCopyWithImpl(this._value, this._then);

  final HostStats _value;
  // ignore: unused_field
  final $Res Function(HostStats) _then;

  @override
  $Res call({
    Object? host = freezed,
    Object? pingCount = freezed,
    Object? pingTime = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      pingCount: pingCount == freezed
          ? _value.pingCount
          : pingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingTime: pingTime == freezed
          ? _value.pingTime
          : pingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$HostStatsCopyWith<$Res> implements $HostStatsCopyWith<$Res> {
  factory _$HostStatsCopyWith(
          _HostStats value, $Res Function(_HostStats) then) =
      __$HostStatsCopyWithImpl<$Res>;
  @override
  $Res call({String host, int pingCount, DateTime pingTime});
}

/// @nodoc
class __$HostStatsCopyWithImpl<$Res> extends _$HostStatsCopyWithImpl<$Res>
    implements _$HostStatsCopyWith<$Res> {
  __$HostStatsCopyWithImpl(_HostStats _value, $Res Function(_HostStats) _then)
      : super(_value, (v) => _then(v as _HostStats));

  @override
  _HostStats get _value => super._value as _HostStats;

  @override
  $Res call({
    Object? host = freezed,
    Object? pingCount = freezed,
    Object? pingTime = freezed,
  }) {
    return _then(_HostStats(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      pingCount: pingCount == freezed
          ? _value.pingCount
          : pingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingTime: pingTime == freezed
          ? _value.pingTime
          : pingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HostStats implements _HostStats {
  _$_HostStats(
      {required this.host, required this.pingCount, required this.pingTime});

  factory _$_HostStats.fromJson(Map<String, dynamic> json) =>
      _$$_HostStatsFromJson(json);

  @override
  final String host;
  @override
  final int pingCount;
  @override
  final DateTime pingTime;

  @override
  String toString() {
    return 'HostStats(host: $host, pingCount: $pingCount, pingTime: $pingTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HostStats &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.pingCount, pingCount) ||
                other.pingCount == pingCount) &&
            (identical(other.pingTime, pingTime) ||
                other.pingTime == pingTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, host, pingCount, pingTime);

  @JsonKey(ignore: true)
  @override
  _$HostStatsCopyWith<_HostStats> get copyWith =>
      __$HostStatsCopyWithImpl<_HostStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HostStatsToJson(this);
  }
}

abstract class _HostStats implements HostStats {
  factory _HostStats(
      {required String host,
      required int pingCount,
      required DateTime pingTime}) = _$_HostStats;

  factory _HostStats.fromJson(Map<String, dynamic> json) =
      _$_HostStats.fromJson;

  @override
  String get host;
  @override
  int get pingCount;
  @override
  DateTime get pingTime;
  @override
  @JsonKey(ignore: true)
  _$HostStatsCopyWith<_HostStats> get copyWith =>
      throw _privateConstructorUsedError;
}
