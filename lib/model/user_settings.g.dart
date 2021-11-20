// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSettings _$$_UserSettingsFromJson(Map<String, dynamic> json) =>
    _$_UserSettings(
      pingSettings:
          PingSettings.fromJson(json['pingSettings'] as Map<String, dynamic>),
      shareSettings:
          ShareSettings.fromJson(json['shareSettings'] as Map<String, dynamic>),
      traySettings: json['traySettings'] == null
          ? null
          : TraySettings.fromJson(json['traySettings'] as Map<String, dynamic>),
      showSystemNotification: json['showSystemNotification'] as bool,
      restoreHost: json['restoreHost'] as bool,
      nightMode: json['nightMode'] as bool,
    );

Map<String, dynamic> _$$_UserSettingsToJson(_$_UserSettings instance) =>
    <String, dynamic>{
      'pingSettings': instance.pingSettings.toJson(),
      'shareSettings': instance.shareSettings.toJson(),
      'traySettings': instance.traySettings?.toJson(),
      'showSystemNotification': instance.showSystemNotification,
      'restoreHost': instance.restoreHost,
      'nightMode': instance.nightMode,
    };

_$_ShareSettings _$$_ShareSettingsFromJson(Map<String, dynamic> json) =>
    _$_ShareSettings(
      shareResults: json['shareResults'] as bool,
      attachLocation: json['attachLocation'] as bool,
    );

Map<String, dynamic> _$$_ShareSettingsToJson(_$_ShareSettings instance) =>
    <String, dynamic>{
      'shareResults': instance.shareResults,
      'attachLocation': instance.attachLocation,
    };

_$_PingSettings _$$_PingSettingsFromJson(Map<String, dynamic> json) =>
    _$_PingSettings(
      count: NumSetting.fromJson(json['count']),
      packetSize: json['packetSize'] as int,
      interval: json['interval'] as int,
      timeout: json['timeout'] as int,
    );

Map<String, dynamic> _$$_PingSettingsToJson(_$_PingSettings instance) =>
    <String, dynamic>{
      'count': instance.count.toJson(),
      'packetSize': instance.packetSize,
      'interval': instance.interval,
      'timeout': instance.timeout,
    };

_$_FiniteNumSetting _$$_FiniteNumSettingFromJson(Map<String, dynamic> json) =>
    _$_FiniteNumSetting(
      value: json['value'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_FiniteNumSettingToJson(_$_FiniteNumSetting instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$_InfiniteNumSetting _$$_InfiniteNumSettingFromJson(
        Map<String, dynamic> json) =>
    _$_InfiniteNumSetting(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_InfiniteNumSettingToJson(
        _$_InfiniteNumSetting instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_TraySettings _$$_TraySettingsFromJson(Map<String, dynamic> json) =>
    _$_TraySettings(
      enabled: json['enabled'] as bool,
      autoReveal: json['autoReveal'] as bool,
    );

Map<String, dynamic> _$$_TraySettingsToJson(_$_TraySettings instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'autoReveal': instance.autoReveal,
    };
