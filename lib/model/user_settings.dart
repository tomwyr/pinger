import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_settings.g.dart';

@CopyWith()
@JsonSerializable()
class UserSettings {
  final PingSettings pingSettings;
  final ShareSettings shareSettings;
  final bool showSystemNotification;
  final bool nightModeEnabled;
  final bool rememberHost;

  UserSettings({
    this.pingSettings,
    this.shareSettings,
    this.showSystemNotification,
    this.nightModeEnabled,
    this.rememberHost,
  });

  static UserSettings fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

@CopyWith()
@JsonSerializable()
class ShareSettings {
  final bool shareResults;
  final bool attachLocation;

  ShareSettings({this.shareResults, this.attachLocation});

  factory ShareSettings.fromJson(Map<String, dynamic> json) =>
      _$ShareSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$ShareSettingsToJson(this);
}

@CopyWith()
@JsonSerializable()
class PingSettings {
  final int count;
  final int packetSize;
  final int sendInterval;
  final int timeout;

  PingSettings({
    this.count,
    this.packetSize,
    this.sendInterval,
    this.timeout,
  });

  static PingSettings fromJson(Map<String, dynamic> json) =>
      _$PingSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$PingSettingsToJson(this);
}
