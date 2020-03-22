// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PingSession {
  PingHost get host;
  PingStatus get status;
  List<double> get values;
  DateTime get startTime;

  PingSession copyWith(
      {PingHost host,
      PingStatus status,
      List<double> values,
      DateTime startTime});
}

class _$PingSessionTearOff {
  const _$PingSessionTearOff();

  _PingSession call(
      {@required PingHost host,
      @required PingStatus status,
      List<double> values = const [],
      DateTime startTime}) {
    return _PingSession(
      host: host,
      status: status,
      values: values,
      startTime: startTime,
    );
  }
}

const $PingSession = _$PingSessionTearOff();

class _$_PingSession implements _PingSession {
  _$_PingSession(
      {@required this.host,
      @required this.status,
      this.values = const [],
      this.startTime})
      : assert(host != null),
        assert(status != null);

  @override
  final PingHost host;
  @override
  final PingStatus status;
  @JsonKey(defaultValue: const [])
  @override
  final List<double> values;
  @override
  final DateTime startTime;
  bool _didstats = false;
  PingStats _stats;

  @override
  PingStats get stats {
    if (_didstats == false) {
      _didstats = true;
      _stats = values.isNotEmpty ? PingStats.fromValues(values) : null;
    }
    return _stats;
  }

  @override
  String toString() {
    return 'PingSession(host: $host, status: $status, values: $values, startTime: $startTime, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingSession &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(startTime);

  @override
  _$_PingSession copyWith({
    Object host = freezed,
    Object status = freezed,
    Object values = freezed,
    Object startTime = freezed,
  }) {
    return _$_PingSession(
      host: host == freezed ? this.host : host as PingHost,
      status: status == freezed ? this.status : status as PingStatus,
      values: values == freezed ? this.values : values as List<double>,
      startTime: startTime == freezed ? this.startTime : startTime as DateTime,
    );
  }
}

abstract class _PingSession implements PingSession {
  factory _PingSession(
      {@required PingHost host,
      @required PingStatus status,
      List<double> values,
      DateTime startTime}) = _$_PingSession;

  @override
  PingHost get host;
  @override
  PingStatus get status;
  @override
  List<double> get values;
  @override
  DateTime get startTime;

  @override
  _PingSession copyWith(
      {PingHost host,
      PingStatus status,
      List<double> values,
      DateTime startTime});
}
