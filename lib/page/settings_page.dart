import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/intro_page.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/widgets/settings/settings_sections.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final SettingsStore _settingsStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Observer(builder: (_) {
        final settings = _settingsStore.userSettings;
        if (settings == null) return Container();
        return ListView(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 24.0, 16.0),
          children: <Widget>[
            PingSettingsSection(
              settings: settings.pingSettings,
              onChanged: (it) => _settingsStore.update(
                settings.copyWith(pingSettings: it),
              ),
            ),
            Container(height: 24.0),
            ShareSettingsSection(
              settings: settings.shareSettings,
              onChanged: (it) => _settingsStore.update(
                settings.copyWith(shareSettings: it),
              ),
            ),
            Container(height: 24.0),
            OtherSettingsSection(
              settings: settings,
              onChanged: _settingsStore.update,
            ),
            Container(height: 48.0),
            SettingsFooterSection(
              onShowIntroPressed: () => push(IntroPage()),
            ),
          ],
        );
      }),
    );
  }
}
