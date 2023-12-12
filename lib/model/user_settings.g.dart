// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
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

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'pingSettings': instance.pingSettings.toJson(),
      'shareSettings': instance.shareSettings.toJson(),
      'traySettings': instance.traySettings?.toJson(),
      'showSystemNotification': instance.showSystemNotification,
      'restoreHost': instance.restoreHost,
      'nightMode': instance.nightMode,
    };

_$ShareSettingsImpl _$$ShareSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ShareSettingsImpl(
      shareResults: json['shareResults'] as bool,
      attachLocation: json['attachLocation'] as bool,
    );

Map<String, dynamic> _$$ShareSettingsImplToJson(_$ShareSettingsImpl instance) =>
    <String, dynamic>{
      'shareResults': instance.shareResults,
      'attachLocation': instance.attachLocation,
    };

_$PingSettingsImpl _$$PingSettingsImplFromJson(Map<String, dynamic> json) =>
    _$PingSettingsImpl(
      count: NumSetting.fromJson(json['count']),
      packetSize: json['packetSize'] as int,
      interval: json['interval'] as int,
      timeout: json['timeout'] as int,
    );

Map<String, dynamic> _$$PingSettingsImplToJson(_$PingSettingsImpl instance) =>
    <String, dynamic>{
      'count': instance.count.toJson(),
      'packetSize': instance.packetSize,
      'interval': instance.interval,
      'timeout': instance.timeout,
    };

_$FiniteNumSettingImpl _$$FiniteNumSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$FiniteNumSettingImpl(
      value: json['value'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FiniteNumSettingImplToJson(
        _$FiniteNumSettingImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'runtimeType': instance.$type,
    };

_$InfiniteNumSettingImpl _$$InfiniteNumSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$InfiniteNumSettingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InfiniteNumSettingImplToJson(
        _$InfiniteNumSettingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$TraySettingsImpl _$$TraySettingsImplFromJson(Map<String, dynamic> json) =>
    _$TraySettingsImpl(
      enabled: json['enabled'] as bool,
      autoReveal: json['autoReveal'] as bool,
    );

Map<String, dynamic> _$$TraySettingsImplToJson(_$TraySettingsImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'autoReveal': instance.autoReveal,
    };
