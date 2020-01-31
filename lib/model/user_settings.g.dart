// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

// ignore_for_file: argument_type_not_assignable, implicit_dynamic_type, always_specify_types

extension UserSettingsCopyWithExtension on UserSettings {
  UserSettings copyWith({
    bool nightModeEnabled,
    PingSettings pingSettings,
    bool rememberHost,
    ShareSettings shareSettings,
    bool showSystemNotification,
  }) {
    return UserSettings(
      nightModeEnabled: nightModeEnabled ?? this.nightModeEnabled,
      pingSettings: pingSettings ?? this.pingSettings,
      rememberHost: rememberHost ?? this.rememberHost,
      shareSettings: shareSettings ?? this.shareSettings,
      showSystemNotification:
          showSystemNotification ?? this.showSystemNotification,
    );
  }
}

// ignore_for_file: argument_type_not_assignable, implicit_dynamic_type, always_specify_types

extension ShareSettingsCopyWithExtension on ShareSettings {
  ShareSettings copyWith({
    bool attachLocation,
    bool shareResults,
  }) {
    return ShareSettings(
      attachLocation: attachLocation ?? this.attachLocation,
      shareResults: shareResults ?? this.shareResults,
    );
  }
}

// ignore_for_file: argument_type_not_assignable, implicit_dynamic_type, always_specify_types

extension PingSettingsCopyWithExtension on PingSettings {
  PingSettings copyWith({
    int count,
    int packetSize,
    int sendInterval,
    int timeout,
  }) {
    return PingSettings(
      count: count ?? this.count,
      packetSize: packetSize ?? this.packetSize,
      sendInterval: sendInterval ?? this.sendInterval,
      timeout: timeout ?? this.timeout,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return UserSettings(
    pingSettings: json['pingSettings'] == null
        ? null
        : PingSettings.fromJson(json['pingSettings'] as Map<String, dynamic>),
    shareSettings: json['shareSettings'] == null
        ? null
        : ShareSettings.fromJson(json['shareSettings'] as Map<String, dynamic>),
    showSystemNotification: json['showSystemNotification'] as bool,
    nightModeEnabled: json['nightModeEnabled'] as bool,
    rememberHost: json['rememberHost'] as bool,
  );
}

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'pingSettings': instance.pingSettings,
      'shareSettings': instance.shareSettings,
      'showSystemNotification': instance.showSystemNotification,
      'nightModeEnabled': instance.nightModeEnabled,
      'rememberHost': instance.rememberHost,
    };

ShareSettings _$ShareSettingsFromJson(Map<String, dynamic> json) {
  return ShareSettings(
    shareResults: json['shareResults'] as bool,
    attachLocation: json['attachLocation'] as bool,
  );
}

Map<String, dynamic> _$ShareSettingsToJson(ShareSettings instance) =>
    <String, dynamic>{
      'shareResults': instance.shareResults,
      'attachLocation': instance.attachLocation,
    };

PingSettings _$PingSettingsFromJson(Map<String, dynamic> json) {
  return PingSettings(
    count: json['count'] as int,
    packetSize: json['packetSize'] as int,
    sendInterval: json['sendInterval'] as int,
    timeout: json['timeout'] as int,
  );
}

Map<String, dynamic> _$PingSettingsToJson(PingSettings instance) =>
    <String, dynamic>{
      'count': instance.count,
      'packetSize': instance.packetSize,
      'sendInterval': instance.sendInterval,
      'timeout': instance.timeout,
    };
