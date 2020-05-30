import 'package:flutter/material.dart';
import 'package:pinger/model/user_settings.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/settings/settings_items.dart';

class PingSettingsSection extends StatelessWidget {
  final bool showHeader;
  final PingSettings settings;
  final ValueChanged<PingSettings> onChanged;

  const PingSettingsSection({
    Key key,
    this.showHeader = true,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showHeader) SettingsHeaderItem(title: "Ping"),
        PingSettingItem(
          label: "Count",
          unit: "x",
          value: settings.count,
          onChanged: (it) => onChanged(settings.copyWith(
            count: it,
          )),
        ),
        PingSettingItem(
          label: "Packet size",
          unit: "B",
          value: settings.packetSize,
          onChanged: (it) => onChanged(settings.copyWith(
            packetSize: it,
          )),
        ),
        PingSettingItem(
          label: "Interval",
          unit: "s",
          value: settings.interval,
          onChanged: (it) => onChanged(settings.copyWith(
            interval: it,
          )),
        ),
        PingSettingItem(
          label: "Timeout",
          unit: "s",
          value: settings.timeout,
          onChanged: (it) => onChanged(settings.copyWith(
            timeout: it,
          )),
        )
      ],
    );
  }
}

class OtherSettingsSection extends StatelessWidget {
  final UserSettings settings;
  final ValueChanged<UserSettings> onChanged;

  const OtherSettingsSection({
    Key key,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SettingsHeaderItem(title: "Other"),
        SwitchSettingItem(
          label: "Remember host",
          description:
              "Application will automatically proceed to new session with latest host",
          value: settings.rememberHost,
          onChanged: (it) => onChanged(settings.copyWith(
            rememberHost: it,
          )),
        ),
        SwitchSettingItem(
          label: "System notification",
          description:
              "Application will show current status of running session in system tray",
          value: settings.showSystemNotification,
          onChanged: (it) => onChanged(settings.copyWith(
            showSystemNotification: it,
          )),
        ),
        SwitchSettingItem(
          label: "Night mode",
          value: settings.nightMode,
          onChanged: (it) => onChanged(settings.copyWith(
            nightMode: it,
          )),
        )
      ],
    );
  }
}

class ShareSettingsSection extends StatelessWidget {
  final ShareSettings settings;
  final ValueChanged<ShareSettings> onChanged;

  const ShareSettingsSection({
    Key key,
    @required this.settings,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SettingsHeaderItem(title: "Results"),
        SwitchSettingItem(
          label: "Share results",
          description:
              "Results statistics will be sent to allow other application users to compare their results",
          value: settings.shareResults,
          onChanged: (it) => onChanged(settings.copyWith(
            shareResults: it,
          )),
        ),
        SwitchSettingItem(
          label: "Attach location",
          description:
              "Current location will be attached to statistics data to allow present it on global results map",
          enabled: settings.attachLocation,
          value: settings.attachLocation,
          onChanged: (it) => onChanged(settings.copyWith(
            attachLocation: it,
          )),
        ),
      ],
    );
  }
}

class SettingsFooterSection extends StatelessWidget {
  final VoidCallback onShowIntroPressed;

  const SettingsFooterSection({
    Key key,
    @required this.onShowIntroPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: ButtonTheme.fromButtonThemeData(
            data: R.themes.raisedButton,
            child: RaisedButton(
              child: Text("Show intro"),
              onPressed: onShowIntroPressed,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Version",
                style: TextStyle(fontSize: 18.0, color: R.colors.gray),
              ),
              Container(width: 12.0),
              Text(
                "1.0.5",
                style: TextStyle(fontSize: 18.0, color: R.colors.primary),
              ),
            ],
          ),
        )
      ],
    );
  }
}
