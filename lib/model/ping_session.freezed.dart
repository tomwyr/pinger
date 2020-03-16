// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$PingSession {
  List<double> get values;
  PingStatus get status;
  PingHost get host;
  DateTime get startTime;

  PingSession copyWith(
      {List<double> values,
      PingStatus status,
      PingHost host,
      DateTime startTime});
}

class _$PingSessionTearOff {
  const _$PingSessionTearOff();

  _PingSession call(
      {@required List<double> values,
      @required PingStatus status,
      @required PingHost host,
      DateTime startTime}) {
    return _PingSession(
      values: values,
      status: status,
      host: host,
      startTime: startTime,
    );
  }
}

const $PingSession = _$PingSessionTearOff();

class _$_PingSession implements _PingSession {
  _$_PingSession(
      {@required this.values,
      @required this.status,
      @required this.host,
      this.startTime})
      : assert(values != null),
        assert(status != null),
        assert(host != null);

  @override
  final List<double> values;
  @override
  final PingStatus status;
  @override
  final PingHost host;
  @override
  final DateTime startTime;

  @override
  String toString() {
    return 'PingSession(values: $values, status: $status, host: $host, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingSession &&
            (identical(other.values, values) ||
                const DeepCollectionEquality().equals(other.values, values)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.startTime, startTime) ||
                const DeepCollectionEquality()
                    .equals(other.startTime, startTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(startTime);

  @override
  _$_PingSession copyWith({
    Object values = freezed,
    Object status = freezed,
    Object host = freezed,
    Object startTime = freezed,
  }) {
    return _$_PingSession(
      values: values == freezed ? this.values : values as List<double>,
      status: status == freezed ? this.status : status as PingStatus,
      host: host == freezed ? this.host : host as PingHost,
      startTime: startTime == freezed ? this.startTime : startTime as DateTime,
    );
  }
}

abstract class _PingSession implements PingSession {
  factory _PingSession(
      {@required List<double> values,
      @required PingStatus status,
      @required PingHost host,
      DateTime startTime}) = _$_PingSession;

  @override
  List<double> get values;
  @override
  PingStatus get status;
  @override
  PingHost get host;
  @override
  DateTime get startTime;

  @override
  _PingSession copyWith(
      {List<double> values,
      PingStatus status,
      PingHost host,
      DateTime startTime});
}
