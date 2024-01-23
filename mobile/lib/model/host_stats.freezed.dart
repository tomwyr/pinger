// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostStats _$HostStatsFromJson(Map<String, dynamic> json) {
  return _HostStats.fromJson(json);
}

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
      _$HostStatsCopyWithImpl<$Res, HostStats>;
  @useResult
  $Res call({String host, int pingCount, DateTime pingTime});
}

/// @nodoc
class _$HostStatsCopyWithImpl<$Res, $Val extends HostStats>
    implements $HostStatsCopyWith<$Res> {
  _$HostStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? pingCount = null,
    Object? pingTime = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      pingCount: null == pingCount
          ? _value.pingCount
          : pingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingTime: null == pingTime
          ? _value.pingTime
          : pingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HostStatsImplCopyWith<$Res>
    implements $HostStatsCopyWith<$Res> {
  factory _$$HostStatsImplCopyWith(
          _$HostStatsImpl value, $Res Function(_$HostStatsImpl) then) =
      __$$HostStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, int pingCount, DateTime pingTime});
}

/// @nodoc
class __$$HostStatsImplCopyWithImpl<$Res>
    extends _$HostStatsCopyWithImpl<$Res, _$HostStatsImpl>
    implements _$$HostStatsImplCopyWith<$Res> {
  __$$HostStatsImplCopyWithImpl(
      _$HostStatsImpl _value, $Res Function(_$HostStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? pingCount = null,
    Object? pingTime = null,
  }) {
    return _then(_$HostStatsImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      pingCount: null == pingCount
          ? _value.pingCount
          : pingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pingTime: null == pingTime
          ? _value.pingTime
          : pingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostStatsImpl implements _HostStats {
  _$HostStatsImpl(
      {required this.host, required this.pingCount, required this.pingTime});

  factory _$HostStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostStatsImplFromJson(json);

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
            other is _$HostStatsImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.pingCount, pingCount) ||
                other.pingCount == pingCount) &&
            (identical(other.pingTime, pingTime) ||
                other.pingTime == pingTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, host, pingCount, pingTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostStatsImplCopyWith<_$HostStatsImpl> get copyWith =>
      __$$HostStatsImplCopyWithImpl<_$HostStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostStatsImplToJson(
      this,
    );
  }
}

abstract class _HostStats implements HostStats {
  factory _HostStats(
      {required final String host,
      required final int pingCount,
      required final DateTime pingTime}) = _$HostStatsImpl;

  factory _HostStats.fromJson(Map<String, dynamic> json) =
      _$HostStatsImpl.fromJson;

  @override
  String get host;
  @override
  int get pingCount;
  @override
  DateTime get pingTime;
  @override
  @JsonKey(ignore: true)
  _$$HostStatsImplCopyWith<_$HostStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
