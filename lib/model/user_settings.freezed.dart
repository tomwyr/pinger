// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

mixin _$UserSettings {
  PingSettings get pingSettings;
  ShareSettings get shareSettings;
  bool get showSystemNotification;
  bool get nightModeEnabled;
  bool get rememberHost;

  UserSettings copyWith(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      bool showSystemNotification,
      bool nightModeEnabled,
      bool rememberHost});

  Map<String, dynamic> toJson();
}

class _$UserSettingsTearOff {
  const _$UserSettingsTearOff();

  _UserSettings call(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      bool showSystemNotification,
      bool nightModeEnabled,
      bool rememberHost}) {
    return _UserSettings(
      pingSettings: pingSettings,
      shareSettings: shareSettings,
      showSystemNotification: showSystemNotification,
      nightModeEnabled: nightModeEnabled,
      rememberHost: rememberHost,
    );
  }
}

const $UserSettings = _$UserSettingsTearOff();

@JsonSerializable()
class _$_UserSettings implements _UserSettings {
  _$_UserSettings(
      {this.pingSettings,
      this.shareSettings,
      this.showSystemNotification,
      this.nightModeEnabled,
      this.rememberHost});

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_UserSettingsFromJson(json);

  @override
  final PingSettings pingSettings;
  @override
  final ShareSettings shareSettings;
  @override
  final bool showSystemNotification;
  @override
  final bool nightModeEnabled;
  @override
  final bool rememberHost;

  @override
  String toString() {
    return 'UserSettings(pingSettings: $pingSettings, shareSettings: $shareSettings, showSystemNotification: $showSystemNotification, nightModeEnabled: $nightModeEnabled, rememberHost: $rememberHost)';
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
            (identical(other.showSystemNotification, showSystemNotification) ||
                const DeepCollectionEquality().equals(
                    other.showSystemNotification, showSystemNotification)) &&
            (identical(other.nightModeEnabled, nightModeEnabled) ||
                const DeepCollectionEquality()
                    .equals(other.nightModeEnabled, nightModeEnabled)) &&
            (identical(other.rememberHost, rememberHost) ||
                const DeepCollectionEquality()
                    .equals(other.rememberHost, rememberHost)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pingSettings) ^
      const DeepCollectionEquality().hash(shareSettings) ^
      const DeepCollectionEquality().hash(showSystemNotification) ^
      const DeepCollectionEquality().hash(nightModeEnabled) ^
      const DeepCollectionEquality().hash(rememberHost);

  @override
  _$_UserSettings copyWith({
    Object pingSettings = freezed,
    Object shareSettings = freezed,
    Object showSystemNotification = freezed,
    Object nightModeEnabled = freezed,
    Object rememberHost = freezed,
  }) {
    return _$_UserSettings(
      pingSettings: pingSettings == freezed
          ? this.pingSettings
          : pingSettings as PingSettings,
      shareSettings: shareSettings == freezed
          ? this.shareSettings
          : shareSettings as ShareSettings,
      showSystemNotification: showSystemNotification == freezed
          ? this.showSystemNotification
          : showSystemNotification as bool,
      nightModeEnabled: nightModeEnabled == freezed
          ? this.nightModeEnabled
          : nightModeEnabled as bool,
      rememberHost:
          rememberHost == freezed ? this.rememberHost : rememberHost as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserSettingsToJson(this);
  }
}

abstract class _UserSettings implements UserSettings {
  factory _UserSettings(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      bool showSystemNotification,
      bool nightModeEnabled,
      bool rememberHost}) = _$_UserSettings;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$_UserSettings.fromJson;

  @override
  PingSettings get pingSettings;
  @override
  ShareSettings get shareSettings;
  @override
  bool get showSystemNotification;
  @override
  bool get nightModeEnabled;
  @override
  bool get rememberHost;

  @override
  _UserSettings copyWith(
      {PingSettings pingSettings,
      ShareSettings shareSettings,
      bool showSystemNotification,
      bool nightModeEnabled,
      bool rememberHost});
}

ShareSettings _$ShareSettingsFromJson(Map<String, dynamic> json) {
  return _ShareSettings.fromJson(json);
}

mixin _$ShareSettings {
  bool get shareResults;
  bool get attachLocation;

  ShareSettings copyWith({bool shareResults, bool attachLocation});

  Map<String, dynamic> toJson();
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

const $ShareSettings = _$ShareSettingsTearOff();

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
  _$_ShareSettings copyWith({
    Object shareResults = freezed,
    Object attachLocation = freezed,
  }) {
    return _$_ShareSettings(
      shareResults:
          shareResults == freezed ? this.shareResults : shareResults as bool,
      attachLocation: attachLocation == freezed
          ? this.attachLocation
          : attachLocation as bool,
    );
  }

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
  _ShareSettings copyWith({bool shareResults, bool attachLocation});
}

PingSettings _$PingSettingsFromJson(Map<String, dynamic> json) {
  return _PingSettings.fromJson(json);
}

mixin _$PingSettings {
  int get count;
  int get packetSize;
  int get sendInterval;
  int get timeout;

  PingSettings copyWith(
      {int count, int packetSize, int sendInterval, int timeout});

  Map<String, dynamic> toJson();
}

class _$PingSettingsTearOff {
  const _$PingSettingsTearOff();

  _PingSettings call(
      {int count, int packetSize, int sendInterval, int timeout}) {
    return _PingSettings(
      count: count,
      packetSize: packetSize,
      sendInterval: sendInterval,
      timeout: timeout,
    );
  }
}

const $PingSettings = _$PingSettingsTearOff();

@JsonSerializable()
class _$_PingSettings implements _PingSettings {
  _$_PingSettings(
      {this.count, this.packetSize, this.sendInterval, this.timeout});

  factory _$_PingSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_PingSettingsFromJson(json);

  @override
  final int count;
  @override
  final int packetSize;
  @override
  final int sendInterval;
  @override
  final int timeout;

  @override
  String toString() {
    return 'PingSettings(count: $count, packetSize: $packetSize, sendInterval: $sendInterval, timeout: $timeout)';
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
            (identical(other.sendInterval, sendInterval) ||
                const DeepCollectionEquality()
                    .equals(other.sendInterval, sendInterval)) &&
            (identical(other.timeout, timeout) ||
                const DeepCollectionEquality().equals(other.timeout, timeout)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(packetSize) ^
      const DeepCollectionEquality().hash(sendInterval) ^
      const DeepCollectionEquality().hash(timeout);

  @override
  _$_PingSettings copyWith({
    Object count = freezed,
    Object packetSize = freezed,
    Object sendInterval = freezed,
    Object timeout = freezed,
  }) {
    return _$_PingSettings(
      count: count == freezed ? this.count : count as int,
      packetSize: packetSize == freezed ? this.packetSize : packetSize as int,
      sendInterval:
          sendInterval == freezed ? this.sendInterval : sendInterval as int,
      timeout: timeout == freezed ? this.timeout : timeout as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PingSettingsToJson(this);
  }
}

abstract class _PingSettings implements PingSettings {
  factory _PingSettings(
      {int count,
      int packetSize,
      int sendInterval,
      int timeout}) = _$_PingSettings;

  factory _PingSettings.fromJson(Map<String, dynamic> json) =
      _$_PingSettings.fromJson;

  @override
  int get count;
  @override
  int get packetSize;
  @override
  int get sendInterval;
  @override
  int get timeout;

  @override
  _PingSettings copyWith(
      {int count, int packetSize, int sendInterval, int timeout});
}
