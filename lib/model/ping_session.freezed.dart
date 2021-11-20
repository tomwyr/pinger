// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PingSessionTearOff {
  const _$PingSessionTearOff();

  _PingSession call(
      {required String host,
      required PingStatus status,
      required PingSettings settings,
      List<int?>? values,
      DateTime? startTime}) {
    return _PingSession(
      host: host,
      status: status,
      settings: settings,
      values: values,
      startTime: startTime,
    );
  }
}

/// @nodoc
const $PingSession = _$PingSessionTearOff();

/// @nodoc
mixin _$PingSession {
  String get host => throw _privateConstructorUsedError;
  PingStatus get status => throw _privateConstructorUsedError;
  PingSettings get settings => throw _privateConstructorUsedError;
  List<int?>? get values => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PingSessionCopyWith<PingSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingSessionCopyWith<$Res> {
  factory $PingSessionCopyWith(
          PingSession value, $Res Function(PingSession) then) =
      _$PingSessionCopyWithImpl<$Res>;
  $Res call(
      {String host,
      PingStatus status,
      PingSettings settings,
      List<int?>? values,
      DateTime? startTime});

  $PingSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$PingSessionCopyWithImpl<$Res> implements $PingSessionCopyWith<$Res> {
  _$PingSessionCopyWithImpl(this._value, this._then);

  final PingSession _value;
  // ignore: unused_field
  final $Res Function(PingSession) _then;

  @override
  $Res call({
    Object? host = freezed,
    Object? status = freezed,
    Object? settings = freezed,
    Object? values = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PingStatus,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $PingSettingsCopyWith<$Res> get settings {
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$PingSessionCopyWith<$Res>
    implements $PingSessionCopyWith<$Res> {
  factory _$PingSessionCopyWith(
          _PingSession value, $Res Function(_PingSession) then) =
      __$PingSessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String host,
      PingStatus status,
      PingSettings settings,
      List<int?>? values,
      DateTime? startTime});

  @override
  $PingSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$PingSessionCopyWithImpl<$Res> extends _$PingSessionCopyWithImpl<$Res>
    implements _$PingSessionCopyWith<$Res> {
  __$PingSessionCopyWithImpl(
      _PingSession _value, $Res Function(_PingSession) _then)
      : super(_value, (v) => _then(v as _PingSession));

  @override
  _PingSession get _value => super._value as _PingSession;

  @override
  $Res call({
    Object? host = freezed,
    Object? status = freezed,
    Object? settings = freezed,
    Object? values = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_PingSession(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PingStatus,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_PingSession extends _PingSession {
  _$_PingSession(
      {required this.host,
      required this.status,
      required this.settings,
      this.values,
      this.startTime})
      : super._();

  @override
  final String host;
  @override
  final PingStatus status;
  @override
  final PingSettings settings;
  @override
  final List<int?>? values;
  @override
  final DateTime? startTime;

  @override
  String toString() {
    return 'PingSession(host: $host, status: $status, settings: $settings, values: $values, startTime: $startTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PingSession &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, host, status, settings,
      const DeepCollectionEquality().hash(values), startTime);

  @JsonKey(ignore: true)
  @override
  _$PingSessionCopyWith<_PingSession> get copyWith =>
      __$PingSessionCopyWithImpl<_PingSession>(this, _$identity);
}

abstract class _PingSession extends PingSession {
  factory _PingSession(
      {required String host,
      required PingStatus status,
      required PingSettings settings,
      List<int?>? values,
      DateTime? startTime}) = _$_PingSession;
  _PingSession._() : super._();

  @override
  String get host;
  @override
  PingStatus get status;
  @override
  PingSettings get settings;
  @override
  List<int?>? get values;
  @override
  DateTime? get startTime;
  @override
  @JsonKey(ignore: true)
  _$PingSessionCopyWith<_PingSession> get copyWith =>
      throw _privateConstructorUsedError;
}
