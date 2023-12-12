// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  PingSettings get pingSettings => throw _privateConstructorUsedError;
  ShareSettings get shareSettings => throw _privateConstructorUsedError;
  TraySettings? get traySettings => throw _privateConstructorUsedError;
  bool get showSystemNotification => throw _privateConstructorUsedError;
  bool get restoreHost => throw _privateConstructorUsedError;
  bool get nightMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings? traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode});

  $PingSettingsCopyWith<$Res> get pingSettings;
  $ShareSettingsCopyWith<$Res> get shareSettings;
  $TraySettingsCopyWith<$Res>? get traySettings;
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pingSettings = null,
    Object? shareSettings = null,
    Object? traySettings = freezed,
    Object? showSystemNotification = null,
    Object? restoreHost = null,
    Object? nightMode = null,
  }) {
    return _then(_value.copyWith(
      pingSettings: null == pingSettings
          ? _value.pingSettings
          : pingSettings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      shareSettings: null == shareSettings
          ? _value.shareSettings
          : shareSettings // ignore: cast_nullable_to_non_nullable
              as ShareSettings,
      traySettings: freezed == traySettings
          ? _value.traySettings
          : traySettings // ignore: cast_nullable_to_non_nullable
              as TraySettings?,
      showSystemNotification: null == showSystemNotification
          ? _value.showSystemNotification
          : showSystemNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      restoreHost: null == restoreHost
          ? _value.restoreHost
          : restoreHost // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: null == nightMode
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PingSettingsCopyWith<$Res> get pingSettings {
    return $PingSettingsCopyWith<$Res>(_value.pingSettings, (value) {
      return _then(_value.copyWith(pingSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShareSettingsCopyWith<$Res> get shareSettings {
    return $ShareSettingsCopyWith<$Res>(_value.shareSettings, (value) {
      return _then(_value.copyWith(shareSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TraySettingsCopyWith<$Res>? get traySettings {
    if (_value.traySettings == null) {
      return null;
    }

    return $TraySettingsCopyWith<$Res>(_value.traySettings!, (value) {
      return _then(_value.copyWith(traySettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings? traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode});

  @override
  $PingSettingsCopyWith<$Res> get pingSettings;
  @override
  $ShareSettingsCopyWith<$Res> get shareSettings;
  @override
  $TraySettingsCopyWith<$Res>? get traySettings;
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pingSettings = null,
    Object? shareSettings = null,
    Object? traySettings = freezed,
    Object? showSystemNotification = null,
    Object? restoreHost = null,
    Object? nightMode = null,
  }) {
    return _then(_$UserSettingsImpl(
      pingSettings: null == pingSettings
          ? _value.pingSettings
          : pingSettings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      shareSettings: null == shareSettings
          ? _value.shareSettings
          : shareSettings // ignore: cast_nullable_to_non_nullable
              as ShareSettings,
      traySettings: freezed == traySettings
          ? _value.traySettings
          : traySettings // ignore: cast_nullable_to_non_nullable
              as TraySettings?,
      showSystemNotification: null == showSystemNotification
          ? _value.showSystemNotification
          : showSystemNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      restoreHost: null == restoreHost
          ? _value.restoreHost
          : restoreHost // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: null == nightMode
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  _$UserSettingsImpl(
      {required this.pingSettings,
      required this.shareSettings,
      this.traySettings,
      required this.showSystemNotification,
      required this.restoreHost,
      required this.nightMode});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final PingSettings pingSettings;
  @override
  final ShareSettings shareSettings;
  @override
  final TraySettings? traySettings;
  @override
  final bool showSystemNotification;
  @override
  final bool restoreHost;
  @override
  final bool nightMode;

  @override
  String toString() {
    return 'UserSettings(pingSettings: $pingSettings, shareSettings: $shareSettings, traySettings: $traySettings, showSystemNotification: $showSystemNotification, restoreHost: $restoreHost, nightMode: $nightMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.pingSettings, pingSettings) ||
                other.pingSettings == pingSettings) &&
            (identical(other.shareSettings, shareSettings) ||
                other.shareSettings == shareSettings) &&
            (identical(other.traySettings, traySettings) ||
                other.traySettings == traySettings) &&
            (identical(other.showSystemNotification, showSystemNotification) ||
                other.showSystemNotification == showSystemNotification) &&
            (identical(other.restoreHost, restoreHost) ||
                other.restoreHost == restoreHost) &&
            (identical(other.nightMode, nightMode) ||
                other.nightMode == nightMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pingSettings, shareSettings,
      traySettings, showSystemNotification, restoreHost, nightMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  factory _UserSettings(
      {required final PingSettings pingSettings,
      required final ShareSettings shareSettings,
      final TraySettings? traySettings,
      required final bool showSystemNotification,
      required final bool restoreHost,
      required final bool nightMode}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  PingSettings get pingSettings;
  @override
  ShareSettings get shareSettings;
  @override
  TraySettings? get traySettings;
  @override
  bool get showSystemNotification;
  @override
  bool get restoreHost;
  @override
  bool get nightMode;
  @override
  @JsonKey(ignore: true)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShareSettings _$ShareSettingsFromJson(Map<String, dynamic> json) {
  return _ShareSettings.fromJson(json);
}

/// @nodoc
mixin _$ShareSettings {
  bool get shareResults => throw _privateConstructorUsedError;
  bool get attachLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareSettingsCopyWith<ShareSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareSettingsCopyWith<$Res> {
  factory $ShareSettingsCopyWith(
          ShareSettings value, $Res Function(ShareSettings) then) =
      _$ShareSettingsCopyWithImpl<$Res, ShareSettings>;
  @useResult
  $Res call({bool shareResults, bool attachLocation});
}

/// @nodoc
class _$ShareSettingsCopyWithImpl<$Res, $Val extends ShareSettings>
    implements $ShareSettingsCopyWith<$Res> {
  _$ShareSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareResults = null,
    Object? attachLocation = null,
  }) {
    return _then(_value.copyWith(
      shareResults: null == shareResults
          ? _value.shareResults
          : shareResults // ignore: cast_nullable_to_non_nullable
              as bool,
      attachLocation: null == attachLocation
          ? _value.attachLocation
          : attachLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareSettingsImplCopyWith<$Res>
    implements $ShareSettingsCopyWith<$Res> {
  factory _$$ShareSettingsImplCopyWith(
          _$ShareSettingsImpl value, $Res Function(_$ShareSettingsImpl) then) =
      __$$ShareSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shareResults, bool attachLocation});
}

/// @nodoc
class __$$ShareSettingsImplCopyWithImpl<$Res>
    extends _$ShareSettingsCopyWithImpl<$Res, _$ShareSettingsImpl>
    implements _$$ShareSettingsImplCopyWith<$Res> {
  __$$ShareSettingsImplCopyWithImpl(
      _$ShareSettingsImpl _value, $Res Function(_$ShareSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareResults = null,
    Object? attachLocation = null,
  }) {
    return _then(_$ShareSettingsImpl(
      shareResults: null == shareResults
          ? _value.shareResults
          : shareResults // ignore: cast_nullable_to_non_nullable
              as bool,
      attachLocation: null == attachLocation
          ? _value.attachLocation
          : attachLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareSettingsImpl implements _ShareSettings {
  _$ShareSettingsImpl(
      {required this.shareResults, required this.attachLocation});

  factory _$ShareSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareSettingsImplFromJson(json);

  @override
  final bool shareResults;
  @override
  final bool attachLocation;

  @override
  String toString() {
    return 'ShareSettings(shareResults: $shareResults, attachLocation: $attachLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareSettingsImpl &&
            (identical(other.shareResults, shareResults) ||
                other.shareResults == shareResults) &&
            (identical(other.attachLocation, attachLocation) ||
                other.attachLocation == attachLocation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shareResults, attachLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareSettingsImplCopyWith<_$ShareSettingsImpl> get copyWith =>
      __$$ShareSettingsImplCopyWithImpl<_$ShareSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareSettingsImplToJson(
      this,
    );
  }
}

abstract class _ShareSettings implements ShareSettings {
  factory _ShareSettings(
      {required final bool shareResults,
      required final bool attachLocation}) = _$ShareSettingsImpl;

  factory _ShareSettings.fromJson(Map<String, dynamic> json) =
      _$ShareSettingsImpl.fromJson;

  @override
  bool get shareResults;
  @override
  bool get attachLocation;
  @override
  @JsonKey(ignore: true)
  _$$ShareSettingsImplCopyWith<_$ShareSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PingSettings _$PingSettingsFromJson(Map<String, dynamic> json) {
  return _PingSettings.fromJson(json);
}

/// @nodoc
mixin _$PingSettings {
  NumSetting get count => throw _privateConstructorUsedError;
  int get packetSize => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingSettingsCopyWith<PingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingSettingsCopyWith<$Res> {
  factory $PingSettingsCopyWith(
          PingSettings value, $Res Function(PingSettings) then) =
      _$PingSettingsCopyWithImpl<$Res, PingSettings>;
  @useResult
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  $NumSettingCopyWith<$Res> get count;
}

/// @nodoc
class _$PingSettingsCopyWithImpl<$Res, $Val extends PingSettings>
    implements $PingSettingsCopyWith<$Res> {
  _$PingSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? packetSize = null,
    Object? interval = null,
    Object? timeout = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumSetting,
      packetSize: null == packetSize
          ? _value.packetSize
          : packetSize // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NumSettingCopyWith<$Res> get count {
    return $NumSettingCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PingSettingsImplCopyWith<$Res>
    implements $PingSettingsCopyWith<$Res> {
  factory _$$PingSettingsImplCopyWith(
          _$PingSettingsImpl value, $Res Function(_$PingSettingsImpl) then) =
      __$$PingSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  @override
  $NumSettingCopyWith<$Res> get count;
}

/// @nodoc
class __$$PingSettingsImplCopyWithImpl<$Res>
    extends _$PingSettingsCopyWithImpl<$Res, _$PingSettingsImpl>
    implements _$$PingSettingsImplCopyWith<$Res> {
  __$$PingSettingsImplCopyWithImpl(
      _$PingSettingsImpl _value, $Res Function(_$PingSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? packetSize = null,
    Object? interval = null,
    Object? timeout = null,
  }) {
    return _then(_$PingSettingsImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumSetting,
      packetSize: null == packetSize
          ? _value.packetSize
          : packetSize // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PingSettingsImpl implements _PingSettings {
  _$PingSettingsImpl(
      {required this.count,
      required this.packetSize,
      required this.interval,
      required this.timeout});

  factory _$PingSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PingSettingsImplFromJson(json);

  @override
  final NumSetting count;
  @override
  final int packetSize;
  @override
  final int interval;
  @override
  final int timeout;

  @override
  String toString() {
    return 'PingSettings(count: $count, packetSize: $packetSize, interval: $interval, timeout: $timeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PingSettingsImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.packetSize, packetSize) ||
                other.packetSize == packetSize) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, count, packetSize, interval, timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PingSettingsImplCopyWith<_$PingSettingsImpl> get copyWith =>
      __$$PingSettingsImplCopyWithImpl<_$PingSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PingSettingsImplToJson(
      this,
    );
  }
}

abstract class _PingSettings implements PingSettings {
  factory _PingSettings(
      {required final NumSetting count,
      required final int packetSize,
      required final int interval,
      required final int timeout}) = _$PingSettingsImpl;

  factory _PingSettings.fromJson(Map<String, dynamic> json) =
      _$PingSettingsImpl.fromJson;

  @override
  NumSetting get count;
  @override
  int get packetSize;
  @override
  int get interval;
  @override
  int get timeout;
  @override
  @JsonKey(ignore: true)
  _$$PingSettingsImplCopyWith<_$PingSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NumSetting _$NumSettingFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'finite':
      return _FiniteNumSetting.fromJson(json);
    case 'infinite':
      return _InfiniteNumSetting.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NumSetting',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NumSetting {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) finite,
    required TResult Function() infinite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? finite,
    TResult? Function()? infinite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? finite,
    TResult Function()? infinite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FiniteNumSetting value) finite,
    required TResult Function(_InfiniteNumSetting value) infinite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FiniteNumSetting value)? finite,
    TResult? Function(_InfiniteNumSetting value)? infinite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumSettingCopyWith<$Res> {
  factory $NumSettingCopyWith(
          NumSetting value, $Res Function(NumSetting) then) =
      _$NumSettingCopyWithImpl<$Res, NumSetting>;
}

/// @nodoc
class _$NumSettingCopyWithImpl<$Res, $Val extends NumSetting>
    implements $NumSettingCopyWith<$Res> {
  _$NumSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FiniteNumSettingImplCopyWith<$Res> {
  factory _$$FiniteNumSettingImplCopyWith(_$FiniteNumSettingImpl value,
          $Res Function(_$FiniteNumSettingImpl) then) =
      __$$FiniteNumSettingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$FiniteNumSettingImplCopyWithImpl<$Res>
    extends _$NumSettingCopyWithImpl<$Res, _$FiniteNumSettingImpl>
    implements _$$FiniteNumSettingImplCopyWith<$Res> {
  __$$FiniteNumSettingImplCopyWithImpl(_$FiniteNumSettingImpl _value,
      $Res Function(_$FiniteNumSettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$FiniteNumSettingImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiniteNumSettingImpl implements _FiniteNumSetting {
  const _$FiniteNumSettingImpl({required this.value, final String? $type})
      : $type = $type ?? 'finite';

  factory _$FiniteNumSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiniteNumSettingImplFromJson(json);

  @override
  final int value;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NumSetting.finite(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiniteNumSettingImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FiniteNumSettingImplCopyWith<_$FiniteNumSettingImpl> get copyWith =>
      __$$FiniteNumSettingImplCopyWithImpl<_$FiniteNumSettingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) finite,
    required TResult Function() infinite,
  }) {
    return finite(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? finite,
    TResult? Function()? infinite,
  }) {
    return finite?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? finite,
    TResult Function()? infinite,
    required TResult orElse(),
  }) {
    if (finite != null) {
      return finite(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FiniteNumSetting value) finite,
    required TResult Function(_InfiniteNumSetting value) infinite,
  }) {
    return finite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FiniteNumSetting value)? finite,
    TResult? Function(_InfiniteNumSetting value)? infinite,
  }) {
    return finite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
    required TResult orElse(),
  }) {
    if (finite != null) {
      return finite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FiniteNumSettingImplToJson(
      this,
    );
  }
}

abstract class _FiniteNumSetting implements NumSetting {
  const factory _FiniteNumSetting({required final int value}) =
      _$FiniteNumSettingImpl;

  factory _FiniteNumSetting.fromJson(Map<String, dynamic> json) =
      _$FiniteNumSettingImpl.fromJson;

  int get value;
  @JsonKey(ignore: true)
  _$$FiniteNumSettingImplCopyWith<_$FiniteNumSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InfiniteNumSettingImplCopyWith<$Res> {
  factory _$$InfiniteNumSettingImplCopyWith(_$InfiniteNumSettingImpl value,
          $Res Function(_$InfiniteNumSettingImpl) then) =
      __$$InfiniteNumSettingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InfiniteNumSettingImplCopyWithImpl<$Res>
    extends _$NumSettingCopyWithImpl<$Res, _$InfiniteNumSettingImpl>
    implements _$$InfiniteNumSettingImplCopyWith<$Res> {
  __$$InfiniteNumSettingImplCopyWithImpl(_$InfiniteNumSettingImpl _value,
      $Res Function(_$InfiniteNumSettingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$InfiniteNumSettingImpl implements _InfiniteNumSetting {
  const _$InfiniteNumSettingImpl({final String? $type})
      : $type = $type ?? 'infinite';

  factory _$InfiniteNumSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfiniteNumSettingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NumSetting.infinite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InfiniteNumSettingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) finite,
    required TResult Function() infinite,
  }) {
    return infinite();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? finite,
    TResult? Function()? infinite,
  }) {
    return infinite?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? finite,
    TResult Function()? infinite,
    required TResult orElse(),
  }) {
    if (infinite != null) {
      return infinite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FiniteNumSetting value) finite,
    required TResult Function(_InfiniteNumSetting value) infinite,
  }) {
    return infinite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FiniteNumSetting value)? finite,
    TResult? Function(_InfiniteNumSetting value)? infinite,
  }) {
    return infinite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
    required TResult orElse(),
  }) {
    if (infinite != null) {
      return infinite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InfiniteNumSettingImplToJson(
      this,
    );
  }
}

abstract class _InfiniteNumSetting implements NumSetting {
  const factory _InfiniteNumSetting() = _$InfiniteNumSettingImpl;

  factory _InfiniteNumSetting.fromJson(Map<String, dynamic> json) =
      _$InfiniteNumSettingImpl.fromJson;
}

TraySettings _$TraySettingsFromJson(Map<String, dynamic> json) {
  return _TraySettings.fromJson(json);
}

/// @nodoc
mixin _$TraySettings {
  bool get enabled => throw _privateConstructorUsedError;
  bool get autoReveal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TraySettingsCopyWith<TraySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraySettingsCopyWith<$Res> {
  factory $TraySettingsCopyWith(
          TraySettings value, $Res Function(TraySettings) then) =
      _$TraySettingsCopyWithImpl<$Res, TraySettings>;
  @useResult
  $Res call({bool enabled, bool autoReveal});
}

/// @nodoc
class _$TraySettingsCopyWithImpl<$Res, $Val extends TraySettings>
    implements $TraySettingsCopyWith<$Res> {
  _$TraySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? autoReveal = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoReveal: null == autoReveal
          ? _value.autoReveal
          : autoReveal // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TraySettingsImplCopyWith<$Res>
    implements $TraySettingsCopyWith<$Res> {
  factory _$$TraySettingsImplCopyWith(
          _$TraySettingsImpl value, $Res Function(_$TraySettingsImpl) then) =
      __$$TraySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, bool autoReveal});
}

/// @nodoc
class __$$TraySettingsImplCopyWithImpl<$Res>
    extends _$TraySettingsCopyWithImpl<$Res, _$TraySettingsImpl>
    implements _$$TraySettingsImplCopyWith<$Res> {
  __$$TraySettingsImplCopyWithImpl(
      _$TraySettingsImpl _value, $Res Function(_$TraySettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? autoReveal = null,
  }) {
    return _then(_$TraySettingsImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoReveal: null == autoReveal
          ? _value.autoReveal
          : autoReveal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TraySettingsImpl implements _TraySettings {
  _$TraySettingsImpl({required this.enabled, required this.autoReveal});

  factory _$TraySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TraySettingsImplFromJson(json);

  @override
  final bool enabled;
  @override
  final bool autoReveal;

  @override
  String toString() {
    return 'TraySettings(enabled: $enabled, autoReveal: $autoReveal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TraySettingsImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.autoReveal, autoReveal) ||
                other.autoReveal == autoReveal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, autoReveal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TraySettingsImplCopyWith<_$TraySettingsImpl> get copyWith =>
      __$$TraySettingsImplCopyWithImpl<_$TraySettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TraySettingsImplToJson(
      this,
    );
  }
}

abstract class _TraySettings implements TraySettings {
  factory _TraySettings(
      {required final bool enabled,
      required final bool autoReveal}) = _$TraySettingsImpl;

  factory _TraySettings.fromJson(Map<String, dynamic> json) =
      _$TraySettingsImpl.fromJson;

  @override
  bool get enabled;
  @override
  bool get autoReveal;
  @override
  @JsonKey(ignore: true)
  _$$TraySettingsImplCopyWith<_$TraySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
