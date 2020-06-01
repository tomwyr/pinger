// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PingSessionTearOff {
  const _$PingSessionTearOff();

  _PingSession call(
      {@required PingHost host,
      @required PingStatus status,
      @required PingSettings settings,
      List<int> values,
      DateTime startTime}) {
    return _PingSession(
      host: host,
      status: status,
      settings: settings,
      values: values,
      startTime: startTime,
    );
  }
}

// ignore: unused_element
const $PingSession = _$PingSessionTearOff();

mixin _$PingSession {
  PingHost get host;
  PingStatus get status;
  PingSettings get settings;
  List<int> get values;
  DateTime get startTime;

  $PingSessionCopyWith<PingSession> get copyWith;
}

abstract class $PingSessionCopyWith<$Res> {
  factory $PingSessionCopyWith(
          PingSession value, $Res Function(PingSession) then) =
      _$PingSessionCopyWithImpl<$Res>;
  $Res call(
      {PingHost host,
      PingStatus status,
      PingSettings settings,
      List<int> values,
      DateTime startTime});

  $PingHostCopyWith<$Res> get host;
  $PingSettingsCopyWith<$Res> get settings;
}

class _$PingSessionCopyWithImpl<$Res> implements $PingSessionCopyWith<$Res> {
  _$PingSessionCopyWithImpl(this._value, this._then);

  final PingSession _value;
  // ignore: unused_field
  final $Res Function(PingSession) _then;

  @override
  $Res call({
    Object host = freezed,
    Object status = freezed,
    Object settings = freezed,
    Object values = freezed,
    Object startTime = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed ? _value.host : host as PingHost,
      status: status == freezed ? _value.status : status as PingStatus,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      values: values == freezed ? _value.values : values as List<int>,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
    ));
  }

  @override
  $PingHostCopyWith<$Res> get host {
    if (_value.host == null) {
      return null;
    }
    return $PingHostCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value));
    });
  }

  @override
  $PingSettingsCopyWith<$Res> get settings {
    if (_value.settings == null) {
      return null;
    }
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

abstract class _$PingSessionCopyWith<$Res>
    implements $PingSessionCopyWith<$Res> {
  factory _$PingSessionCopyWith(
          _PingSession value, $Res Function(_PingSession) then) =
      __$PingSessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {PingHost host,
      PingStatus status,
      PingSettings settings,
      List<int> values,
      DateTime startTime});

  @override
  $PingHostCopyWith<$Res> get host;
  @override
  $PingSettingsCopyWith<$Res> get settings;
}

class __$PingSessionCopyWithImpl<$Res> extends _$PingSessionCopyWithImpl<$Res>
    implements _$PingSessionCopyWith<$Res> {
  __$PingSessionCopyWithImpl(
      _PingSession _value, $Res Function(_PingSession) _then)
      : super(_value, (v) => _then(v as _PingSession));

  @override
  _PingSession get _value => super._value as _PingSession;

  @override
  $Res call({
    Object host = freezed,
    Object status = freezed,
    Object settings = freezed,
    Object values = freezed,
    Object startTime = freezed,
  }) {
    return _then(_PingSession(
      host: host == freezed ? _value.host : host as PingHost,
      status: status == freezed ? _value.status : status as PingStatus,
      settings:
          settings == freezed ? _value.settings : settings as PingSettings,
      values: values == freezed ? _value.values : values as List<int>,
      startTime:
          startTime == freezed ? _value.startTime : startTime as DateTime,
    ));
  }
}

class _$_PingSession implements _PingSession {
  _$_PingSession(
      {@required this.host,
      @required this.status,
      @required this.settings,
      this.values,
      this.startTime})
      : assert(host != null),
        assert(status != null),
        assert(settings != null);

  @override
  final PingHost host;
  @override
  final PingStatus status;
  @override
  final PingSettings settings;
  @override
  final List<int> values;
  @override
  final DateTime startTime;

  bool _didstats = false;
  PingStats _stats;

  @override
  PingStats get stats {
    if (_didstats == false) {
      _didstats = true;
      _stats = PingStats.fromValues(values);
    }
    return _stats;
  }

  @override
  String toString() {
    return 'PingSession(host: $host, status: $status, settings: $settings, values: $values, startTime: $startTime, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PingSession &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
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
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(values) ^
      const DeepCollectionEquality().hash(startTime);

  @override
  _$PingSessionCopyWith<_PingSession> get copyWith =>
      __$PingSessionCopyWithImpl<_PingSession>(this, _$identity);
}

abstract class _PingSession implements PingSession {
  factory _PingSession(
      {@required PingHost host,
      @required PingStatus status,
      @required PingSettings settings,
      List<int> values,
      DateTime startTime}) = _$_PingSession;

  @override
  PingHost get host;
  @override
  PingStatus get status;
  @override
  PingSettings get settings;
  @override
  List<int> get values;
  @override
  DateTime get startTime;
  @override
  _$PingSessionCopyWith<_PingSession> get copyWith;
}
