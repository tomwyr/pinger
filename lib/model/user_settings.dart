import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
abstract class UserSettings with _$UserSettings {
  factory UserSettings({
    PingSettings pingSettings,
    ShareSettings shareSettings,
    TraySettings traySettings,
    bool showSystemNotification,
    bool restoreHost,
    bool nightMode,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}

@freezed
abstract class ShareSettings with _$ShareSettings {
  factory ShareSettings({bool shareResults, bool attachLocation}) =
      _ShareSettings;

  factory ShareSettings.fromJson(Map<String, dynamic> json) =>
      _$ShareSettingsFromJson(json);
}

@freezed
abstract class PingSettings with _$PingSettings {
  factory PingSettings({
    NumSetting count,
    int packetSize,
    int interval,
    int timeout,
  }) = _PingSettings;

  factory PingSettings.fromJson(Map<String, dynamic> json) =>
      _$PingSettingsFromJson(json);
}

@freezed
abstract class NumSetting with _$NumSetting {
  const factory NumSetting.finite([int value]) = _FiniteNumSetting;
  const factory NumSetting.infinite() = _InfiniteNumSetting;

  factory NumSetting.fromJson(json) =>
      json is int ? NumSetting.finite(json) : _$NumSettingFromJson(json);
}

@freezed
abstract class TraySettings with _$TraySettings {
  factory TraySettings({bool enabled, bool autoReveal}) = _TraySettings;

  factory TraySettings.fromJson(Map<String, dynamic> json) =>
      _$TraySettingsFromJson(json);
}
