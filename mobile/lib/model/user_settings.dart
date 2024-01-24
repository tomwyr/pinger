import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
class UserSettings with _$UserSettings {
  factory UserSettings({
    required PingSettings pingSettings,
    required ShareSettings shareSettings,
    TraySettings? traySettings,
    required bool showSystemNotification,
    required bool restoreHost,
    required bool nightMode,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) => _$UserSettingsFromJson(json);
}

@freezed
class ShareSettings with _$ShareSettings {
  factory ShareSettings({
    required bool shareResults,
    required bool attachLocation,
  }) = _ShareSettings;

  factory ShareSettings.fromJson(Map<String, dynamic> json) => _$ShareSettingsFromJson(json);
}

@freezed
class PingSettings with _$PingSettings {
  factory PingSettings({
    required NumSetting count,
    required int packetSize,
    required int interval,
    required int timeout,
  }) = _PingSettings;

  factory PingSettings.fromJson(Map<String, dynamic> json) => _$PingSettingsFromJson(json);
}

@freezed
class NumSetting with _$NumSetting {
  const factory NumSetting.finite({required int value}) = _FiniteNumSetting;
  const factory NumSetting.infinite() = _InfiniteNumSetting;

  factory NumSetting.fromJson(json) =>
      json is int ? NumSetting.finite(value: json) : _$NumSettingFromJson(json);
}

@freezed
class TraySettings with _$TraySettings {
  factory TraySettings({
    required bool enabled,
    required bool autoReveal,
  }) = _TraySettings;

  factory TraySettings.fromJson(Map<String, dynamic> json) => _$TraySettingsFromJson(json);
}
