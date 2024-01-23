// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ping_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PingSessionCopyWithImpl<$Res, PingSession>;
  @useResult
  $Res call(
      {String host,
      PingStatus status,
      PingSettings settings,
      List<int?>? values,
      DateTime? startTime});

  $PingSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$PingSessionCopyWithImpl<$Res, $Val extends PingSession>
    implements $PingSessionCopyWith<$Res> {
  _$PingSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? status = null,
    Object? settings = null,
    Object? values = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PingStatus,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      values: freezed == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PingSettingsCopyWith<$Res> get settings {
    return $PingSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PingSessionImplCopyWith<$Res>
    implements $PingSessionCopyWith<$Res> {
  factory _$$PingSessionImplCopyWith(
          _$PingSessionImpl value, $Res Function(_$PingSessionImpl) then) =
      __$$PingSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$PingSessionImplCopyWithImpl<$Res>
    extends _$PingSessionCopyWithImpl<$Res, _$PingSessionImpl>
    implements _$$PingSessionImplCopyWith<$Res> {
  __$$PingSessionImplCopyWithImpl(
      _$PingSessionImpl _value, $Res Function(_$PingSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? status = null,
    Object? settings = null,
    Object? values = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_$PingSessionImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PingStatus,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      values: freezed == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PingSessionImpl extends _PingSession {
  _$PingSessionImpl(
      {required this.host,
      required this.status,
      required this.settings,
      final List<int?>? values,
      this.startTime})
      : _values = values,
        super._();

  @override
  final String host;
  @override
  final PingStatus status;
  @override
  final PingSettings settings;
  final List<int?>? _values;
  @override
  List<int?>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
            other is _$PingSessionImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, host, status, settings,
      const DeepCollectionEquality().hash(_values), startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingSessionImplCopyWith<_$PingSessionImpl> get copyWith =>
      __$$PingSessionImplCopyWithImpl<_$PingSessionImpl>(this, _$identity);
}

abstract class _PingSession extends PingSession {
  factory _PingSession(
      {required final String host,
      required final PingStatus status,
      required final PingSettings settings,
      final List<int?>? values,
      final DateTime? startTime}) = _$PingSessionImpl;
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
  _$$PingSessionImplCopyWith<_$PingSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
