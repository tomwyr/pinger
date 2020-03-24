// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'host_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
HostStats _$HostStatsFromJson(Map<String, dynamic> json) {
  return _HostStats.fromJson(json);
}

class _$HostStatsTearOff {
  const _$HostStatsTearOff();

  _HostStats call(
      {@required String host,
      @required int pingCount,
      @required DateTime pingTime}) {
    return _HostStats(
      host: host,
      pingCount: pingCount,
      pingTime: pingTime,
    );
  }
}

// ignore: unused_element
const $HostStats = _$HostStatsTearOff();

mixin _$HostStats {
  String get host;
  int get pingCount;
  DateTime get pingTime;

  Map<String, dynamic> toJson();
  $HostStatsCopyWith<HostStats> get copyWith;
}

abstract class $HostStatsCopyWith<$Res> {
  factory $HostStatsCopyWith(HostStats value, $Res Function(HostStats) then) =
      _$HostStatsCopyWithImpl<$Res>;
  $Res call({String host, int pingCount, DateTime pingTime});
}

class _$HostStatsCopyWithImpl<$Res> implements $HostStatsCopyWith<$Res> {
  _$HostStatsCopyWithImpl(this._value, this._then);

  final HostStats _value;
  // ignore: unused_field
  final $Res Function(HostStats) _then;

  @override
  $Res call({
    Object host = freezed,
    Object pingCount = freezed,
    Object pingTime = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed ? _value.host : host as String,
      pingCount: pingCount == freezed ? _value.pingCount : pingCount as int,
      pingTime: pingTime == freezed ? _value.pingTime : pingTime as DateTime,
    ));
  }
}

abstract class _$HostStatsCopyWith<$Res> implements $HostStatsCopyWith<$Res> {
  factory _$HostStatsCopyWith(
          _HostStats value, $Res Function(_HostStats) then) =
      __$HostStatsCopyWithImpl<$Res>;
  @override
  $Res call({String host, int pingCount, DateTime pingTime});
}

class __$HostStatsCopyWithImpl<$Res> extends _$HostStatsCopyWithImpl<$Res>
    implements _$HostStatsCopyWith<$Res> {
  __$HostStatsCopyWithImpl(_HostStats _value, $Res Function(_HostStats) _then)
      : super(_value, (v) => _then(v as _HostStats));

  @override
  _HostStats get _value => super._value as _HostStats;

  @override
  $Res call({
    Object host = freezed,
    Object pingCount = freezed,
    Object pingTime = freezed,
  }) {
    return _then(_HostStats(
      host: host == freezed ? _value.host : host as String,
      pingCount: pingCount == freezed ? _value.pingCount : pingCount as int,
      pingTime: pingTime == freezed ? _value.pingTime : pingTime as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_HostStats implements _HostStats {
  _$_HostStats(
      {@required this.host, @required this.pingCount, @required this.pingTime})
      : assert(host != null),
        assert(pingCount != null),
        assert(pingTime != null);

  factory _$_HostStats.fromJson(Map<String, dynamic> json) =>
      _$_$_HostStatsFromJson(json);

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
        (other is _HostStats &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.pingCount, pingCount) ||
                const DeepCollectionEquality()
                    .equals(other.pingCount, pingCount)) &&
            (identical(other.pingTime, pingTime) ||
                const DeepCollectionEquality()
                    .equals(other.pingTime, pingTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(pingCount) ^
      const DeepCollectionEquality().hash(pingTime);

  @override
  _$HostStatsCopyWith<_HostStats> get copyWith =>
      __$HostStatsCopyWithImpl<_HostStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_HostStatsToJson(this);
  }
}

abstract class _HostStats implements HostStats {
  factory _HostStats(
      {@required String host,
      @required int pingCount,
      @required DateTime pingTime}) = _$_HostStats;

  factory _HostStats.fromJson(Map<String, dynamic> json) =
      _$_HostStats.fromJson;

  @override
  String get host;
  @override
  int get pingCount;
  @override
  DateTime get pingTime;
  @override
  _$HostStatsCopyWith<_HostStats> get copyWith;
}
