import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

@freezed
abstract class UserSettings with _$UserSettings {
  factory UserSettings({
    PingSettings pingSettings,
    ShareSettings shareSettings,
    bool showSystemNotification,
    bool nightModeEnabled,
    bool rememberHost,
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
    int count,
    int packetSize,
    int sendInterval,
    int timeout,
  }) = _PingSettings;

  factory PingSettings.fromJson(Map<String, dynamic> json) =>
      _$PingSettingsFromJson(json);
}
