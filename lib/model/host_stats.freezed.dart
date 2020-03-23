// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'host_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

HostStats _$HostStatsFromJson(Map<String, dynamic> json) {
  return _HostStats.fromJson(json);
}

mixin _$HostStats {
  String get host;
  int get pingCount;
  DateTime get pingTime;

  HostStats copyWith({String host, int pingCount, DateTime pingTime});

  Map<String, dynamic> toJson();
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

const $HostStats = _$HostStatsTearOff();

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
  _$_HostStats copyWith({
    Object host = freezed,
    Object pingCount = freezed,
    Object pingTime = freezed,
  }) {
    return _$_HostStats(
      host: host == freezed ? this.host : host as String,
      pingCount: pingCount == freezed ? this.pingCount : pingCount as int,
      pingTime: pingTime == freezed ? this.pingTime : pingTime as DateTime,
    );
  }

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
  _HostStats copyWith({String host, int pingCount, DateTime pingTime});
}
