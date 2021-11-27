// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
class _$UserSettingsTearOff {
  const _$UserSettingsTearOff();

  _UserSettings call(
      {required PingSettings pingSettings,
      required ShareSettings shareSettings,
      TraySettings? traySettings,
      required bool showSystemNotification,
      required bool restoreHost,
      required bool nightMode}) {
    return _UserSettings(
      pingSettings: pingSettings,
      shareSettings: shareSettings,
      traySettings: traySettings,
      showSystemNotification: showSystemNotification,
      restoreHost: restoreHost,
      nightMode: nightMode,
    );
  }

  UserSettings fromJson(Map<String, Object?> json) {
    return UserSettings.fromJson(json);
  }
}

/// @nodoc
const $UserSettings = _$UserSettingsTearOff();

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
  $UserSettingsCopyWith<UserSettings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res>;
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
class _$UserSettingsCopyWithImpl<$Res> implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  final UserSettings _value;
  // ignore: unused_field
  final $Res Function(UserSettings) _then;

  @override
  $Res call({
    Object? pingSettings = freezed,
    Object? shareSettings = freezed,
    Object? traySettings = freezed,
    Object? showSystemNotification = freezed,
    Object? restoreHost = freezed,
    Object? nightMode = freezed,
  }) {
    return _then(_value.copyWith(
      pingSettings: pingSettings == freezed
          ? _value.pingSettings
          : pingSettings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      shareSettings: shareSettings == freezed
          ? _value.shareSettings
          : shareSettings // ignore: cast_nullable_to_non_nullable
              as ShareSettings,
      traySettings: traySettings == freezed
          ? _value.traySettings
          : traySettings // ignore: cast_nullable_to_non_nullable
              as TraySettings?,
      showSystemNotification: showSystemNotification == freezed
          ? _value.showSystemNotification
          : showSystemNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      restoreHost: restoreHost == freezed
          ? _value.restoreHost
          : restoreHost // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: nightMode == freezed
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PingSettingsCopyWith<$Res> get pingSettings {
    return $PingSettingsCopyWith<$Res>(_value.pingSettings, (value) {
      return _then(_value.copyWith(pingSettings: value));
    });
  }

  @override
  $ShareSettingsCopyWith<$Res> get shareSettings {
    return $ShareSettingsCopyWith<$Res>(_value.shareSettings, (value) {
      return _then(_value.copyWith(shareSettings: value));
    });
  }

  @override
  $TraySettingsCopyWith<$Res>? get traySettings {
    if (_value.traySettings == null) {
      return null;
    }

    return $TraySettingsCopyWith<$Res>(_value.traySettings!, (value) {
      return _then(_value.copyWith(traySettings: value));
    });
  }
}

/// @nodoc
abstract class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) then) =
      __$UserSettingsCopyWithImpl<$Res>;
  @override
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
class __$UserSettingsCopyWithImpl<$Res> extends _$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(_UserSettings _value, $Res Function(_UserSettings) _then)
      : super(_value, (v) => _then(v as _UserSettings));

  @override
  _UserSettings get _value => super._value as _UserSettings;

  @override
  $Res call({
    Object? pingSettings = freezed,
    Object? shareSettings = freezed,
    Object? traySettings = freezed,
    Object? showSystemNotification = freezed,
    Object? restoreHost = freezed,
    Object? nightMode = freezed,
  }) {
    return _then(_UserSettings(
      pingSettings: pingSettings == freezed
          ? _value.pingSettings
          : pingSettings // ignore: cast_nullable_to_non_nullable
              as PingSettings,
      shareSettings: shareSettings == freezed
          ? _value.shareSettings
          : shareSettings // ignore: cast_nullable_to_non_nullable
              as ShareSettings,
      traySettings: traySettings == freezed
          ? _value.traySettings
          : traySettings // ignore: cast_nullable_to_non_nullable
              as TraySettings?,
      showSystemNotification: showSystemNotification == freezed
          ? _value.showSystemNotification
          : showSystemNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      restoreHost: restoreHost == freezed
          ? _value.restoreHost
          : restoreHost // ignore: cast_nullable_to_non_nullable
              as bool,
      nightMode: nightMode == freezed
          ? _value.nightMode
          : nightMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettings implements _UserSettings {
  _$_UserSettings(
      {required this.pingSettings,
      required this.shareSettings,
      this.traySettings,
      required this.showSystemNotification,
      required this.restoreHost,
      required this.nightMode});

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) => _$$_UserSettingsFromJson(json);

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
            other is _UserSettings &&
            (identical(other.pingSettings, pingSettings) || other.pingSettings == pingSettings) &&
            (identical(other.shareSettings, shareSettings) ||
                other.shareSettings == shareSettings) &&
            (identical(other.traySettings, traySettings) || other.traySettings == traySettings) &&
            (identical(other.showSystemNotification, showSystemNotification) ||
                other.showSystemNotification == showSystemNotification) &&
            (identical(other.restoreHost, restoreHost) || other.restoreHost == restoreHost) &&
            (identical(other.nightMode, nightMode) || other.nightMode == nightMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pingSettings, shareSettings, traySettings,
      showSystemNotification, restoreHost, nightMode);

  @JsonKey(ignore: true)
  @override
  _$UserSettingsCopyWith<_UserSettings> get copyWith =>
      __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingsToJson(this);
  }
}

abstract class _UserSettings implements UserSettings {
  factory _UserSettings(
      {required PingSettings pingSettings,
      required ShareSettings shareSettings,
      TraySettings? traySettings,
      required bool showSystemNotification,
      required bool restoreHost,
      required bool nightMode}) = _$_UserSettings;

  factory _UserSettings.fromJson(Map<String, dynamic> json) = _$_UserSettings.fromJson;

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
  _$UserSettingsCopyWith<_UserSettings> get copyWith => throw _privateConstructorUsedError;
}

ShareSettings _$ShareSettingsFromJson(Map<String, dynamic> json) {
  return _ShareSettings.fromJson(json);
}

/// @nodoc
class _$ShareSettingsTearOff {
  const _$ShareSettingsTearOff();

  _ShareSettings call({required bool shareResults, required bool attachLocation}) {
    return _ShareSettings(
      shareResults: shareResults,
      attachLocation: attachLocation,
    );
  }

  ShareSettings fromJson(Map<String, Object?> json) {
    return ShareSettings.fromJson(json);
  }
}

/// @nodoc
const $ShareSettings = _$ShareSettingsTearOff();

/// @nodoc
mixin _$ShareSettings {
  bool get shareResults => throw _privateConstructorUsedError;
  bool get attachLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareSettingsCopyWith<ShareSettings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareSettingsCopyWith<$Res> {
  factory $ShareSettingsCopyWith(ShareSettings value, $Res Function(ShareSettings) then) =
      _$ShareSettingsCopyWithImpl<$Res>;
  $Res call({bool shareResults, bool attachLocation});
}

/// @nodoc
class _$ShareSettingsCopyWithImpl<$Res> implements $ShareSettingsCopyWith<$Res> {
  _$ShareSettingsCopyWithImpl(this._value, this._then);

  final ShareSettings _value;
  // ignore: unused_field
  final $Res Function(ShareSettings) _then;

  @override
  $Res call({
    Object? shareResults = freezed,
    Object? attachLocation = freezed,
  }) {
    return _then(_value.copyWith(
      shareResults: shareResults == freezed
          ? _value.shareResults
          : shareResults // ignore: cast_nullable_to_non_nullable
              as bool,
      attachLocation: attachLocation == freezed
          ? _value.attachLocation
          : attachLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShareSettingsCopyWith<$Res> implements $ShareSettingsCopyWith<$Res> {
  factory _$ShareSettingsCopyWith(_ShareSettings value, $Res Function(_ShareSettings) then) =
      __$ShareSettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool shareResults, bool attachLocation});
}

/// @nodoc
class __$ShareSettingsCopyWithImpl<$Res> extends _$ShareSettingsCopyWithImpl<$Res>
    implements _$ShareSettingsCopyWith<$Res> {
  __$ShareSettingsCopyWithImpl(_ShareSettings _value, $Res Function(_ShareSettings) _then)
      : super(_value, (v) => _then(v as _ShareSettings));

  @override
  _ShareSettings get _value => super._value as _ShareSettings;

  @override
  $Res call({
    Object? shareResults = freezed,
    Object? attachLocation = freezed,
  }) {
    return _then(_ShareSettings(
      shareResults: shareResults == freezed
          ? _value.shareResults
          : shareResults // ignore: cast_nullable_to_non_nullable
              as bool,
      attachLocation: attachLocation == freezed
          ? _value.attachLocation
          : attachLocation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShareSettings implements _ShareSettings {
  _$_ShareSettings({required this.shareResults, required this.attachLocation});

  factory _$_ShareSettings.fromJson(Map<String, dynamic> json) => _$$_ShareSettingsFromJson(json);

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
            other is _ShareSettings &&
            (identical(other.shareResults, shareResults) || other.shareResults == shareResults) &&
            (identical(other.attachLocation, attachLocation) ||
                other.attachLocation == attachLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shareResults, attachLocation);

  @JsonKey(ignore: true)
  @override
  _$ShareSettingsCopyWith<_ShareSettings> get copyWith =>
      __$ShareSettingsCopyWithImpl<_ShareSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareSettingsToJson(this);
  }
}

abstract class _ShareSettings implements ShareSettings {
  factory _ShareSettings({required bool shareResults, required bool attachLocation}) =
      _$_ShareSettings;

  factory _ShareSettings.fromJson(Map<String, dynamic> json) = _$_ShareSettings.fromJson;

  @override
  bool get shareResults;
  @override
  bool get attachLocation;
  @override
  @JsonKey(ignore: true)
  _$ShareSettingsCopyWith<_ShareSettings> get copyWith => throw _privateConstructorUsedError;
}

PingSettings _$PingSettingsFromJson(Map<String, dynamic> json) {
  return _PingSettings.fromJson(json);
}

/// @nodoc
class _$PingSettingsTearOff {
  const _$PingSettingsTearOff();

  _PingSettings call(
      {required NumSetting count,
      required int packetSize,
      required int interval,
      required int timeout}) {
    return _PingSettings(
      count: count,
      packetSize: packetSize,
      interval: interval,
      timeout: timeout,
    );
  }

  PingSettings fromJson(Map<String, Object?> json) {
    return PingSettings.fromJson(json);
  }
}

/// @nodoc
const $PingSettings = _$PingSettingsTearOff();

/// @nodoc
mixin _$PingSettings {
  NumSetting get count => throw _privateConstructorUsedError;
  int get packetSize => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PingSettingsCopyWith<PingSettings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PingSettingsCopyWith<$Res> {
  factory $PingSettingsCopyWith(PingSettings value, $Res Function(PingSettings) then) =
      _$PingSettingsCopyWithImpl<$Res>;
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  $NumSettingCopyWith<$Res> get count;
}

/// @nodoc
class _$PingSettingsCopyWithImpl<$Res> implements $PingSettingsCopyWith<$Res> {
  _$PingSettingsCopyWithImpl(this._value, this._then);

  final PingSettings _value;
  // ignore: unused_field
  final $Res Function(PingSettings) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? packetSize = freezed,
    Object? interval = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumSetting,
      packetSize: packetSize == freezed
          ? _value.packetSize
          : packetSize // ignore: cast_nullable_to_non_nullable
              as int,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $NumSettingCopyWith<$Res> get count {
    return $NumSettingCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value));
    });
  }
}

/// @nodoc
abstract class _$PingSettingsCopyWith<$Res> implements $PingSettingsCopyWith<$Res> {
  factory _$PingSettingsCopyWith(_PingSettings value, $Res Function(_PingSettings) then) =
      __$PingSettingsCopyWithImpl<$Res>;
  @override
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  @override
  $NumSettingCopyWith<$Res> get count;
}

/// @nodoc
class __$PingSettingsCopyWithImpl<$Res> extends _$PingSettingsCopyWithImpl<$Res>
    implements _$PingSettingsCopyWith<$Res> {
  __$PingSettingsCopyWithImpl(_PingSettings _value, $Res Function(_PingSettings) _then)
      : super(_value, (v) => _then(v as _PingSettings));

  @override
  _PingSettings get _value => super._value as _PingSettings;

  @override
  $Res call({
    Object? count = freezed,
    Object? packetSize = freezed,
    Object? interval = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_PingSettings(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as NumSetting,
      packetSize: packetSize == freezed
          ? _value.packetSize
          : packetSize // ignore: cast_nullable_to_non_nullable
              as int,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PingSettings implements _PingSettings {
  _$_PingSettings(
      {required this.count,
      required this.packetSize,
      required this.interval,
      required this.timeout});

  factory _$_PingSettings.fromJson(Map<String, dynamic> json) => _$$_PingSettingsFromJson(json);

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
            other is _PingSettings &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.packetSize, packetSize) || other.packetSize == packetSize) &&
            (identical(other.interval, interval) || other.interval == interval) &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count, packetSize, interval, timeout);

  @JsonKey(ignore: true)
  @override
  _$PingSettingsCopyWith<_PingSettings> get copyWith =>
      __$PingSettingsCopyWithImpl<_PingSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PingSettingsToJson(this);
  }
}

abstract class _PingSettings implements PingSettings {
  factory _PingSettings(
      {required NumSetting count,
      required int packetSize,
      required int interval,
      required int timeout}) = _$_PingSettings;

  factory _PingSettings.fromJson(Map<String, dynamic> json) = _$_PingSettings.fromJson;

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
  _$PingSettingsCopyWith<_PingSettings> get copyWith => throw _privateConstructorUsedError;
}

NumSetting _$NumSettingFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'finite':
      return _FiniteNumSetting.fromJson(json);
    case 'infinite':
      return _InfiniteNumSetting.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'runtimeType', 'NumSetting', 'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$NumSettingTearOff {
  const _$NumSettingTearOff();

  _FiniteNumSetting finite({required int value}) {
    return _FiniteNumSetting(
      value: value,
    );
  }

  _InfiniteNumSetting infinite() {
    return const _InfiniteNumSetting();
  }

  NumSetting fromJson(Map<String, Object?> json) {
    return NumSetting.fromJson(json);
  }
}

/// @nodoc
const $NumSetting = _$NumSettingTearOff();

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
    TResult Function(int value)? finite,
    TResult Function()? infinite,
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
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
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
  factory $NumSettingCopyWith(NumSetting value, $Res Function(NumSetting) then) =
      _$NumSettingCopyWithImpl<$Res>;
}

/// @nodoc
class _$NumSettingCopyWithImpl<$Res> implements $NumSettingCopyWith<$Res> {
  _$NumSettingCopyWithImpl(this._value, this._then);

  final NumSetting _value;
  // ignore: unused_field
  final $Res Function(NumSetting) _then;
}

/// @nodoc
abstract class _$FiniteNumSettingCopyWith<$Res> {
  factory _$FiniteNumSettingCopyWith(
          _FiniteNumSetting value, $Res Function(_FiniteNumSetting) then) =
      __$FiniteNumSettingCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class __$FiniteNumSettingCopyWithImpl<$Res> extends _$NumSettingCopyWithImpl<$Res>
    implements _$FiniteNumSettingCopyWith<$Res> {
  __$FiniteNumSettingCopyWithImpl(_FiniteNumSetting _value, $Res Function(_FiniteNumSetting) _then)
      : super(_value, (v) => _then(v as _FiniteNumSetting));

  @override
  _FiniteNumSetting get _value => super._value as _FiniteNumSetting;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_FiniteNumSetting(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FiniteNumSetting implements _FiniteNumSetting {
  const _$_FiniteNumSetting({required this.value, String? $type}) : $type = $type ?? 'finite';

  factory _$_FiniteNumSetting.fromJson(Map<String, dynamic> json) =>
      _$$_FiniteNumSettingFromJson(json);

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
            other is _FiniteNumSetting &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$FiniteNumSettingCopyWith<_FiniteNumSetting> get copyWith =>
      __$FiniteNumSettingCopyWithImpl<_FiniteNumSetting>(this, _$identity);

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
    TResult Function(int value)? finite,
    TResult Function()? infinite,
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
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
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
    return _$$_FiniteNumSettingToJson(this);
  }
}

abstract class _FiniteNumSetting implements NumSetting {
  const factory _FiniteNumSetting({required int value}) = _$_FiniteNumSetting;

  factory _FiniteNumSetting.fromJson(Map<String, dynamic> json) = _$_FiniteNumSetting.fromJson;

  int get value;
  @JsonKey(ignore: true)
  _$FiniteNumSettingCopyWith<_FiniteNumSetting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$InfiniteNumSettingCopyWith<$Res> {
  factory _$InfiniteNumSettingCopyWith(
          _InfiniteNumSetting value, $Res Function(_InfiniteNumSetting) then) =
      __$InfiniteNumSettingCopyWithImpl<$Res>;
}

/// @nodoc
class __$InfiniteNumSettingCopyWithImpl<$Res> extends _$NumSettingCopyWithImpl<$Res>
    implements _$InfiniteNumSettingCopyWith<$Res> {
  __$InfiniteNumSettingCopyWithImpl(
      _InfiniteNumSetting _value, $Res Function(_InfiniteNumSetting) _then)
      : super(_value, (v) => _then(v as _InfiniteNumSetting));

  @override
  _InfiniteNumSetting get _value => super._value as _InfiniteNumSetting;
}

/// @nodoc
@JsonSerializable()
class _$_InfiniteNumSetting implements _InfiniteNumSetting {
  const _$_InfiniteNumSetting({String? $type}) : $type = $type ?? 'infinite';

  factory _$_InfiniteNumSetting.fromJson(Map<String, dynamic> json) =>
      _$$_InfiniteNumSettingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NumSetting.infinite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InfiniteNumSetting);
  }

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
    TResult Function(int value)? finite,
    TResult Function()? infinite,
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
    TResult Function(_FiniteNumSetting value)? finite,
    TResult Function(_InfiniteNumSetting value)? infinite,
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
    return _$$_InfiniteNumSettingToJson(this);
  }
}

abstract class _InfiniteNumSetting implements NumSetting {
  const factory _InfiniteNumSetting() = _$_InfiniteNumSetting;

  factory _InfiniteNumSetting.fromJson(Map<String, dynamic> json) = _$_InfiniteNumSetting.fromJson;
}

TraySettings _$TraySettingsFromJson(Map<String, dynamic> json) {
  return _TraySettings.fromJson(json);
}

/// @nodoc
class _$TraySettingsTearOff {
  const _$TraySettingsTearOff();

  _TraySettings call({required bool enabled, required bool autoReveal}) {
    return _TraySettings(
      enabled: enabled,
      autoReveal: autoReveal,
    );
  }

  TraySettings fromJson(Map<String, Object?> json) {
    return TraySettings.fromJson(json);
  }
}

/// @nodoc
const $TraySettings = _$TraySettingsTearOff();

/// @nodoc
mixin _$TraySettings {
  bool get enabled => throw _privateConstructorUsedError;
  bool get autoReveal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TraySettingsCopyWith<TraySettings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraySettingsCopyWith<$Res> {
  factory $TraySettingsCopyWith(TraySettings value, $Res Function(TraySettings) then) =
      _$TraySettingsCopyWithImpl<$Res>;
  $Res call({bool enabled, bool autoReveal});
}

/// @nodoc
class _$TraySettingsCopyWithImpl<$Res> implements $TraySettingsCopyWith<$Res> {
  _$TraySettingsCopyWithImpl(this._value, this._then);

  final TraySettings _value;
  // ignore: unused_field
  final $Res Function(TraySettings) _then;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? autoReveal = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoReveal: autoReveal == freezed
          ? _value.autoReveal
          : autoReveal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TraySettingsCopyWith<$Res> implements $TraySettingsCopyWith<$Res> {
  factory _$TraySettingsCopyWith(_TraySettings value, $Res Function(_TraySettings) then) =
      __$TraySettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool enabled, bool autoReveal});
}

/// @nodoc
class __$TraySettingsCopyWithImpl<$Res> extends _$TraySettingsCopyWithImpl<$Res>
    implements _$TraySettingsCopyWith<$Res> {
  __$TraySettingsCopyWithImpl(_TraySettings _value, $Res Function(_TraySettings) _then)
      : super(_value, (v) => _then(v as _TraySettings));

  @override
  _TraySettings get _value => super._value as _TraySettings;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? autoReveal = freezed,
  }) {
    return _then(_TraySettings(
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      autoReveal: autoReveal == freezed
          ? _value.autoReveal
          : autoReveal // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TraySettings implements _TraySettings {
  _$_TraySettings({required this.enabled, required this.autoReveal});

  factory _$_TraySettings.fromJson(Map<String, dynamic> json) => _$$_TraySettingsFromJson(json);

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
            other is _TraySettings &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.autoReveal, autoReveal) || other.autoReveal == autoReveal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, autoReveal);

  @JsonKey(ignore: true)
  @override
  _$TraySettingsCopyWith<_TraySettings> get copyWith =>
      __$TraySettingsCopyWithImpl<_TraySettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TraySettingsToJson(this);
  }
}

abstract class _TraySettings implements TraySettings {
  factory _TraySettings({required bool enabled, required bool autoReveal}) = _$_TraySettings;

  factory _TraySettings.fromJson(Map<String, dynamic> json) = _$_TraySettings.fromJson;

  @override
  bool get enabled;
  @override
  bool get autoReveal;
  @override
  @JsonKey(ignore: true)
  _$TraySettingsCopyWith<_TraySettings> get copyWith => throw _privateConstructorUsedError;
}
