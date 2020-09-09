// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

class _$UserSettingsTearOff {
  const _$UserSettingsTearOff();

  _UserSettings call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode}) {
    return _UserSettings(
      pingSettings: pingSettings,
      shareSettings: shareSettings,
      traySettings: traySettings,
      showSystemNotification: showSystemNotification,
      restoreHost: restoreHost,
      nightMode: nightMode,
    );
  }
}

// ignore: unused_element
const $UserSettings = _$UserSettingsTearOff();

mixin _$UserSettings {
  PingSettings get pingSettings;
  ShareSettings get shareSettings;
  TraySettings get traySettings;
  bool get showSystemNotification;
  bool get restoreHost;
  bool get nightMode;

  Map<String, dynamic> toJson();
  $UserSettingsCopyWith<UserSettings> get copyWith;
}

abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res>;
  $Res call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode});

  $PingSettingsCopyWith<$Res> get pingSettings;
  $ShareSettingsCopyWith<$Res> get shareSettings;
  $TraySettingsCopyWith<$Res> get traySettings;
}

class _$UserSettingsCopyWithImpl<$Res> implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  final UserSettings _value;
  // ignore: unused_field
  final $Res Function(UserSettings) _then;

  @override
  $Res call({
    Object pingSettings = freezed,
    Object shareSettings = freezed,
    Object traySettings = freezed,
    Object showSystemNotification = freezed,
    Object restoreHost = freezed,
    Object nightMode = freezed,
  }) {
    return _then(_value.copyWith(
      pingSettings: pingSettings == freezed
          ? _value.pingSettings
          : pingSettings as PingSettings,
      shareSettings: shareSettings == freezed
          ? _value.shareSettings
          : shareSettings as ShareSettings,
      traySettings: traySettings == freezed
          ? _value.traySettings
          : traySettings as TraySettings,
      showSystemNotification: showSystemNotification == freezed
          ? _value.showSystemNotification
          : showSystemNotification as bool,
      restoreHost:
          restoreHost == freezed ? _value.restoreHost : restoreHost as bool,
      nightMode: nightMode == freezed ? _value.nightMode : nightMode as bool,
    ));
  }

  @override
  $PingSettingsCopyWith<$Res> get pingSettings {
    if (_value.pingSettings == null) {
      return null;
    }
    return $PingSettingsCopyWith<$Res>(_value.pingSettings, (value) {
      return _then(_value.copyWith(pingSettings: value));
    });
  }

  @override
  $ShareSettingsCopyWith<$Res> get shareSettings {
    if (_value.shareSettings == null) {
      return null;
    }
    return $ShareSettingsCopyWith<$Res>(_value.shareSettings, (value) {
      return _then(_value.copyWith(shareSettings: value));
    });
  }

  @override
  $TraySettingsCopyWith<$Res> get traySettings {
    if (_value.traySettings == null) {
      return null;
    }
    return $TraySettingsCopyWith<$Res>(_value.traySettings, (value) {
      return _then(_value.copyWith(traySettings: value));
    });
  }
}

abstract class _$UserSettingsCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(
          _UserSettings value, $Res Function(_UserSettings) then) =
      __$UserSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode});

  @override
  $PingSettingsCopyWith<$Res> get pingSettings;
  @override
  $ShareSettingsCopyWith<$Res> get shareSettings;
  @override
  $TraySettingsCopyWith<$Res> get traySettings;
}

class __$UserSettingsCopyWithImpl<$Res> extends _$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(
      _UserSettings _value, $Res Function(_UserSettings) _then)
      : super(_value, (v) => _then(v as _UserSettings));

  @override
  _UserSettings get _value => super._value as _UserSettings;

  @override
  $Res call({
    Object pingSettings = freezed,
    Object shareSettings = freezed,
    Object traySettings = freezed,
    Object showSystemNotification = freezed,
    Object restoreHost = freezed,
    Object nightMode = freezed,
  }) {
    return _then(_UserSettings(
      pingSettings: pingSettings == freezed
          ? _value.pingSettings
          : pingSettings as PingSettings,
      shareSettings: shareSettings == freezed
          ? _value.shareSettings
          : shareSettings as ShareSettings,
      traySettings: traySettings == freezed
          ? _value.traySettings
          : traySettings as TraySettings,
      showSystemNotification: showSystemNotification == freezed
          ? _value.showSystemNotification
          : showSystemNotification as bool,
      restoreHost:
          restoreHost == freezed ? _value.restoreHost : restoreHost as bool,
      nightMode: nightMode == freezed ? _value.nightMode : nightMode as bool,
    ));
  }
}

@JsonSerializable()
class _$_UserSettings implements _UserSettings {
  _$_UserSettings(
      {this.pingSettings,
      this.shareSettings,
      this.traySettings,
      this.showSystemNotification,
      this.restoreHost,
      this.nightMode});

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSettingsFromJson(json);

  @override
  final PingSettings pingSettings;
  @override
  final ShareSettings shareSettings;
  @override
  final TraySettings traySettings;
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
        (other is _UserSettings &&
            (identical(other.pingSettings, pingSettings) ||
                const DeepCollectionEquality()
                    .equals(other.pingSettings, pingSettings)) &&
            (identical(other.shareSettings, shareSettings) ||
                const DeepCollectionEquality()
                    .equals(other.shareSettings, shareSettings)) &&
            (identical(other.traySettings, traySettings) ||
                const DeepCollectionEquality()
                    .equals(other.traySettings, traySettings)) &&
            (identical(other.showSystemNotification, showSystemNotification) ||
                const DeepCollectionEquality().equals(
                    other.showSystemNotification, showSystemNotification)) &&
            (identical(other.restoreHost, restoreHost) ||
                const DeepCollectionEquality()
                    .equals(other.restoreHost, restoreHost)) &&
            (identical(other.nightMode, nightMode) ||
                const DeepCollectionEquality()
                    .equals(other.nightMode, nightMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pingSettings) ^
      const DeepCollectionEquality().hash(shareSettings) ^
      const DeepCollectionEquality().hash(traySettings) ^
      const DeepCollectionEquality().hash(showSystemNotification) ^
      const DeepCollectionEquality().hash(restoreHost) ^
      const DeepCollectionEquality().hash(nightMode);

  @override
  _$UserSettingsCopyWith<_UserSettings> get copyWith =>
      __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserSettingsToJson(this);
  }
}

abstract class _UserSettings implements UserSettings {
  factory _UserSettings(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      TraySettings traySettings,
      bool showSystemNotification,
      bool restoreHost,
      bool nightMode}) = _$_UserSettings;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$_UserSettings.fromJson;

  @override
  PingSettings get pingSettings;
  @override
  ShareSettings get shareSettings;
  @override
  TraySettings get traySettings;
  @override
  bool get showSystemNotification;
  @override
  bool get restoreHost;
  @override
  bool get nightMode;
  @override
  _$UserSettingsCopyWith<_UserSettings> get copyWith;
}

ShareSettings _$ShareSettingsFromJson(Map<String, dynamic> json) {
  return _ShareSettings.fromJson(json);
}

class _$ShareSettingsTearOff {
  const _$ShareSettingsTearOff();

  _ShareSettings call({bool shareResults, bool attachLocation}) {
    return _ShareSettings(
      shareResults: shareResults,
      attachLocation: attachLocation,
    );
  }
}

// ignore: unused_element
const $ShareSettings = _$ShareSettingsTearOff();

mixin _$ShareSettings {
  bool get shareResults;
  bool get attachLocation;

  Map<String, dynamic> toJson();
  $ShareSettingsCopyWith<ShareSettings> get copyWith;
}

abstract class $ShareSettingsCopyWith<$Res> {
  factory $ShareSettingsCopyWith(
          ShareSettings value, $Res Function(ShareSettings) then) =
      _$ShareSettingsCopyWithImpl<$Res>;
  $Res call({bool shareResults, bool attachLocation});
}

class _$ShareSettingsCopyWithImpl<$Res>
    implements $ShareSettingsCopyWith<$Res> {
  _$ShareSettingsCopyWithImpl(this._value, this._then);

  final ShareSettings _value;
  // ignore: unused_field
  final $Res Function(ShareSettings) _then;

  @override
  $Res call({
    Object shareResults = freezed,
    Object attachLocation = freezed,
  }) {
    return _then(_value.copyWith(
      shareResults:
          shareResults == freezed ? _value.shareResults : shareResults as bool,
      attachLocation: attachLocation == freezed
          ? _value.attachLocation
          : attachLocation as bool,
    ));
  }
}

abstract class _$ShareSettingsCopyWith<$Res>
    implements $ShareSettingsCopyWith<$Res> {
  factory _$ShareSettingsCopyWith(
          _ShareSettings value, $Res Function(_ShareSettings) then) =
      __$ShareSettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool shareResults, bool attachLocation});
}

class __$ShareSettingsCopyWithImpl<$Res>
    extends _$ShareSettingsCopyWithImpl<$Res>
    implements _$ShareSettingsCopyWith<$Res> {
  __$ShareSettingsCopyWithImpl(
      _ShareSettings _value, $Res Function(_ShareSettings) _then)
      : super(_value, (v) => _then(v as _ShareSettings));

  @override
  _ShareSettings get _value => super._value as _ShareSettings;

  @override
  $Res call({
    Object shareResults = freezed,
    Object attachLocation = freezed,
  }) {
    return _then(_ShareSettings(
      shareResults:
          shareResults == freezed ? _value.shareResults : shareResults as bool,
      attachLocation: attachLocation == freezed
          ? _value.attachLocation
          : attachLocation as bool,
    ));
  }
}

@JsonSerializable()
class _$_ShareSettings implements _ShareSettings {
  _$_ShareSettings({this.shareResults, this.attachLocation});

  factory _$_ShareSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_ShareSettingsFromJson(json);

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
        (other is _ShareSettings &&
            (identical(other.shareResults, shareResults) ||
                const DeepCollectionEquality()
                    .equals(other.shareResults, shareResults)) &&
            (identical(other.attachLocation, attachLocation) ||
                const DeepCollectionEquality()
                    .equals(other.attachLocation, attachLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(shareResults) ^
      const DeepCollectionEquality().hash(attachLocation);

  @override
  _$ShareSettingsCopyWith<_ShareSettings> get copyWith =>
      __$ShareSettingsCopyWithImpl<_ShareSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShareSettingsToJson(this);
  }
}

abstract class _ShareSettings implements ShareSettings {
  factory _ShareSettings({bool shareResults, bool attachLocation}) =
      _$_ShareSettings;

  factory _ShareSettings.fromJson(Map<String, dynamic> json) =
      _$_ShareSettings.fromJson;

  @override
  bool get shareResults;
  @override
  bool get attachLocation;
  @override
  _$ShareSettingsCopyWith<_ShareSettings> get copyWith;
}

PingSettings _$PingSettingsFromJson(Map<String, dynamic> json) {
  return _PingSettings.fromJson(json);
}

class _$PingSettingsTearOff {
  const _$PingSettingsTearOff();

  _PingSettings call(
      {NumSetting count, int packetSize, int interval, int timeout}) {
    return _PingSettings(
      count: count,
      packetSize: packetSize,
      interval: interval,
      timeout: timeout,
    );
  }
}

// ignore: unused_element
const $PingSettings = _$PingSettingsTearOff();

mixin _$PingSettings {
  NumSetting get count;
  int get packetSize;
  int get interval;
  int get timeout;

  Map<String, dynamic> toJson();
  $PingSettingsCopyWith<PingSettings> get copyWith;
}

abstract class $PingSettingsCopyWith<$Res> {
  factory $PingSettingsCopyWith(
          PingSettings value, $Res Function(PingSettings) then) =
      _$PingSettingsCopyWithImpl<$Res>;
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  $NumSettingCopyWith<$Res> get count;
}

class _$PingSettingsCopyWithImpl<$Res> implements $PingSettingsCopyWith<$Res> {
  _$PingSettingsCopyWithImpl(this._value, this._then);

  final PingSettings _value;
  // ignore: unused_field
  final $Res Function(PingSettings) _then;

  @override
  $Res call({
    Object count = freezed,
    Object packetSize = freezed,
    Object interval = freezed,
    Object timeout = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed ? _value.count : count as NumSetting,
      packetSize: packetSize == freezed ? _value.packetSize : packetSize as int,
      interval: interval == freezed ? _value.interval : interval as int,
      timeout: timeout == freezed ? _value.timeout : timeout as int,
    ));
  }

  @override
  $NumSettingCopyWith<$Res> get count {
    if (_value.count == null) {
      return null;
    }
    return $NumSettingCopyWith<$Res>(_value.count, (value) {
      return _then(_value.copyWith(count: value));
    });
  }
}

abstract class _$PingSettingsCopyWith<$Res>
    implements $PingSettingsCopyWith<$Res> {
  factory _$PingSettingsCopyWith(
          _PingSettings value, $Res Function(_PingSettings) then) =
      __$PingSettingsCopyWithImpl<$Res>;
  @override
  $Res call({NumSetting count, int packetSize, int interval, int timeout});

  @override
  $NumSettingCopyWith<$Res> get count;
}

class __$PingSettingsCopyWithImpl<$Res> extends _$PingSettingsCopyWithImpl<$Res>
    implements _$PingSettingsCopyWith<$Res> {
  __$PingSettingsCopyWithImpl(
      _PingSettings _value, $Res Function(_PingSettings) _then)
      : super(_value, (v) => _then(v as _PingSettings));

  @override
  _PingSettings get _value => super._value as _PingSettings;

  @override
  $Res call({
    Object count = freezed,
    Object packetSize = freezed,
    Object interval = freezed,
    Object timeout = freezed,
  }) {
    return _then(_PingSettings(
      count: count == freezed ? _value.count : count as NumSetting,
      packetSize: packetSize == freezed ? _value.packetSize : packetSize as int,
      interval: interval == freezed ? _value.interval : interval as int,
      timeout: timeout == freezed ? _value.timeout : timeout as int,
    ));
  }
}

@JsonSerializable()
class _$_PingSettings implements _PingSettings {
  _$_PingSettings({this.count, this.packetSize, this.interval, this.timeout});

  factory _$_PingSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_PingSettingsFromJson(json);

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
        (other is _PingSettings &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.packetSize, packetSize) ||
                const DeepCollectionEquality()
                    .equals(other.packetSize, packetSize)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.timeout, timeout) ||
                const DeepCollectionEquality().equals(other.timeout, timeout)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(packetSize) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(timeout);

  @override
  _$PingSettingsCopyWith<_PingSettings> get copyWith =>
      __$PingSettingsCopyWithImpl<_PingSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingSettingsToJson(this);
  }
}

abstract class _PingSettings implements PingSettings {
  factory _PingSettings(
      {NumSetting count,
      int packetSize,
      int interval,
      int timeout}) = _$_PingSettings;

  factory _PingSettings.fromJson(Map<String, dynamic> json) =
      _$_PingSettings.fromJson;

  @override
  NumSetting get count;
  @override
  int get packetSize;
  @override
  int get interval;
  @override
  int get timeout;
  @override
  _$PingSettingsCopyWith<_PingSettings> get copyWith;
}

NumSetting _$NumSettingFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'finite':
      return _FiniteNumSetting.fromJson(json);
    case 'infinite':
      return _InfiniteNumSetting.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$NumSettingTearOff {
  const _$NumSettingTearOff();

  _FiniteNumSetting finite([int value]) {
    return _FiniteNumSetting(
      value,
    );
  }

  _InfiniteNumSetting infinite() {
    return const _InfiniteNumSetting();
  }
}

// ignore: unused_element
const $NumSetting = _$NumSettingTearOff();

mixin _$NumSetting {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finite(int value),
    @required Result infinite(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finite(int value),
    Result infinite(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finite(_FiniteNumSetting value),
    @required Result infinite(_InfiniteNumSetting value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finite(_FiniteNumSetting value),
    Result infinite(_InfiniteNumSetting value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $NumSettingCopyWith<$Res> {
  factory $NumSettingCopyWith(
          NumSetting value, $Res Function(NumSetting) then) =
      _$NumSettingCopyWithImpl<$Res>;
}

class _$NumSettingCopyWithImpl<$Res> implements $NumSettingCopyWith<$Res> {
  _$NumSettingCopyWithImpl(this._value, this._then);

  final NumSetting _value;
  // ignore: unused_field
  final $Res Function(NumSetting) _then;
}

abstract class _$FiniteNumSettingCopyWith<$Res> {
  factory _$FiniteNumSettingCopyWith(
          _FiniteNumSetting value, $Res Function(_FiniteNumSetting) then) =
      __$FiniteNumSettingCopyWithImpl<$Res>;
  $Res call({int value});
}

class __$FiniteNumSettingCopyWithImpl<$Res>
    extends _$NumSettingCopyWithImpl<$Res>
    implements _$FiniteNumSettingCopyWith<$Res> {
  __$FiniteNumSettingCopyWithImpl(
      _FiniteNumSetting _value, $Res Function(_FiniteNumSetting) _then)
      : super(_value, (v) => _then(v as _FiniteNumSetting));

  @override
  _FiniteNumSetting get _value => super._value as _FiniteNumSetting;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_FiniteNumSetting(
      value == freezed ? _value.value : value as int,
    ));
  }
}

@JsonSerializable()
class _$_FiniteNumSetting implements _FiniteNumSetting {
  const _$_FiniteNumSetting([this.value]);

  factory _$_FiniteNumSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_FiniteNumSettingFromJson(json);

  @override
  final int value;

  @override
  String toString() {
    return 'NumSetting.finite(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FiniteNumSetting &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$FiniteNumSettingCopyWith<_FiniteNumSetting> get copyWith =>
      __$FiniteNumSettingCopyWithImpl<_FiniteNumSetting>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finite(int value),
    @required Result infinite(),
  }) {
    assert(finite != null);
    assert(infinite != null);
    return finite(value);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finite(int value),
    Result infinite(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finite != null) {
      return finite(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finite(_FiniteNumSetting value),
    @required Result infinite(_InfiniteNumSetting value),
  }) {
    assert(finite != null);
    assert(infinite != null);
    return finite(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finite(_FiniteNumSetting value),
    Result infinite(_InfiniteNumSetting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (finite != null) {
      return finite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FiniteNumSettingToJson(this)..['runtimeType'] = 'finite';
  }
}

abstract class _FiniteNumSetting implements NumSetting {
  const factory _FiniteNumSetting([int value]) = _$_FiniteNumSetting;

  factory _FiniteNumSetting.fromJson(Map<String, dynamic> json) =
      _$_FiniteNumSetting.fromJson;

  int get value;
  _$FiniteNumSettingCopyWith<_FiniteNumSetting> get copyWith;
}

abstract class _$InfiniteNumSettingCopyWith<$Res> {
  factory _$InfiniteNumSettingCopyWith(
          _InfiniteNumSetting value, $Res Function(_InfiniteNumSetting) then) =
      __$InfiniteNumSettingCopyWithImpl<$Res>;
}

class __$InfiniteNumSettingCopyWithImpl<$Res>
    extends _$NumSettingCopyWithImpl<$Res>
    implements _$InfiniteNumSettingCopyWith<$Res> {
  __$InfiniteNumSettingCopyWithImpl(
      _InfiniteNumSetting _value, $Res Function(_InfiniteNumSetting) _then)
      : super(_value, (v) => _then(v as _InfiniteNumSetting));

  @override
  _InfiniteNumSetting get _value => super._value as _InfiniteNumSetting;
}

@JsonSerializable()
class _$_InfiniteNumSetting implements _InfiniteNumSetting {
  const _$_InfiniteNumSetting();

  factory _$_InfiniteNumSetting.fromJson(Map<String, dynamic> json) =>
      _$_$_InfiniteNumSettingFromJson(json);

  @override
  String toString() {
    return 'NumSetting.infinite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InfiniteNumSetting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result finite(int value),
    @required Result infinite(),
  }) {
    assert(finite != null);
    assert(infinite != null);
    return infinite();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result finite(int value),
    Result infinite(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (infinite != null) {
      return infinite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result finite(_FiniteNumSetting value),
    @required Result infinite(_InfiniteNumSetting value),
  }) {
    assert(finite != null);
    assert(infinite != null);
    return infinite(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result finite(_FiniteNumSetting value),
    Result infinite(_InfiniteNumSetting value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (infinite != null) {
      return infinite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InfiniteNumSettingToJson(this)..['runtimeType'] = 'infinite';
  }
}

abstract class _InfiniteNumSetting implements NumSetting {
  const factory _InfiniteNumSetting() = _$_InfiniteNumSetting;

  factory _InfiniteNumSetting.fromJson(Map<String, dynamic> json) =
      _$_InfiniteNumSetting.fromJson;
}

TraySettings _$TraySettingsFromJson(Map<String, dynamic> json) {
  return _TraySettings.fromJson(json);
}

class _$TraySettingsTearOff {
  const _$TraySettingsTearOff();

  _TraySettings call({bool enabled, bool autoReveal}) {
    return _TraySettings(
      enabled: enabled,
      autoReveal: autoReveal,
    );
  }
}

// ignore: unused_element
const $TraySettings = _$TraySettingsTearOff();

mixin _$TraySettings {
  bool get enabled;
  bool get autoReveal;

  Map<String, dynamic> toJson();
  $TraySettingsCopyWith<TraySettings> get copyWith;
}

abstract class $TraySettingsCopyWith<$Res> {
  factory $TraySettingsCopyWith(
          TraySettings value, $Res Function(TraySettings) then) =
      _$TraySettingsCopyWithImpl<$Res>;
  $Res call({bool enabled, bool autoReveal});
}

class _$TraySettingsCopyWithImpl<$Res> implements $TraySettingsCopyWith<$Res> {
  _$TraySettingsCopyWithImpl(this._value, this._then);

  final TraySettings _value;
  // ignore: unused_field
  final $Res Function(TraySettings) _then;

  @override
  $Res call({
    Object enabled = freezed,
    Object autoReveal = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      autoReveal:
          autoReveal == freezed ? _value.autoReveal : autoReveal as bool,
    ));
  }
}

abstract class _$TraySettingsCopyWith<$Res>
    implements $TraySettingsCopyWith<$Res> {
  factory _$TraySettingsCopyWith(
          _TraySettings value, $Res Function(_TraySettings) then) =
      __$TraySettingsCopyWithImpl<$Res>;
  @override
  $Res call({bool enabled, bool autoReveal});
}

class __$TraySettingsCopyWithImpl<$Res> extends _$TraySettingsCopyWithImpl<$Res>
    implements _$TraySettingsCopyWith<$Res> {
  __$TraySettingsCopyWithImpl(
      _TraySettings _value, $Res Function(_TraySettings) _then)
      : super(_value, (v) => _then(v as _TraySettings));

  @override
  _TraySettings get _value => super._value as _TraySettings;

  @override
  $Res call({
    Object enabled = freezed,
    Object autoReveal = freezed,
  }) {
    return _then(_TraySettings(
      enabled: enabled == freezed ? _value.enabled : enabled as bool,
      autoReveal:
          autoReveal == freezed ? _value.autoReveal : autoReveal as bool,
    ));
  }
}

@JsonSerializable()
class _$_TraySettings implements _TraySettings {
  _$_TraySettings({this.enabled, this.autoReveal});

  factory _$_TraySettings.fromJson(Map<String, dynamic> json) =>
      _$_$_TraySettingsFromJson(json);

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
        (other is _TraySettings &&
            (identical(other.enabled, enabled) ||
                const DeepCollectionEquality()
                    .equals(other.enabled, enabled)) &&
            (identical(other.autoReveal, autoReveal) ||
                const DeepCollectionEquality()
                    .equals(other.autoReveal, autoReveal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enabled) ^
      const DeepCollectionEquality().hash(autoReveal);

  @override
  _$TraySettingsCopyWith<_TraySettings> get copyWith =>
      __$TraySettingsCopyWithImpl<_TraySettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TraySettingsToJson(this);
  }
}

abstract class _TraySettings implements TraySettings {
  factory _TraySettings({bool enabled, bool autoReveal}) = _$_TraySettings;

  factory _TraySettings.fromJson(Map<String, dynamic> json) =
      _$_TraySettings.fromJson;

  @override
  bool get enabled;
  @override
  bool get autoReveal;
  @override
  _$TraySettingsCopyWith<_TraySettings> get copyWith;
}
