import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/settings/settings_sections.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage> {
  final SettingsStore _settingsStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(S.current.settingsPageTitle),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        final settings = _settingsStore.userSettings;
        final appInfo = _settingsStore.appInfo;
        if (settings == null) return Container();
        return ScrollEdgeGradient(
          color: R.colors.canvas,
          builder: (controller) => ListView(
            controller: controller,
            padding: const EdgeInsets.fromLTRB(32.0, 16.0, 24.0, 16.0),
            children: <Widget>[
              PingSettingsSection(
                settings: settings.pingSettings,
                onChanged: (it) => _settingsStore.updateSettings(
                  settings.copyWith(pingSettings: it),
                ),
              ),
              Container(height: 24.0),
              ShareSettingsSection(
                settings: settings.shareSettings,
                onChanged: (it) => _settingsStore.updateSettings(
                  settings.copyWith(shareSettings: it),
                ),
              ),
              Container(height: 24.0),
              TraySettingsSection(
                settings: settings.traySettings,
                onChanged: (it) => _settingsStore.updateSettings(
                  settings.copyWith(traySettings: it),
                ),
              ),
              Container(height: 24.0),
              OtherSettingsSection(
                settings: settings,
                onChanged: _settingsStore.updateSettings,
              ),
              Container(height: 48.0),
              SettingsFooterSection(
                appInfo: appInfo,
                onShowIntroPressed: () => PingerApp.router.show(RouteConfig.intro()),
              ),
            ],
          ),
        );
      }),
    );
  }
}
