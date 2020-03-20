import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/changelog_page.dart';
import 'package:pinger/page/intro_page.dart';
import 'package:pinger/store/settings_store.dart';

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
      ),
      body: Observer(builder: (_) {
        final settings = _settingsStore?.userSettings;
        if (settings == null) return Container();
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: <Widget>[
            _buildGroup("Ping", [
              _buildItem(
                _buildLabel("Count"),
                _buildIntValue(
                  settings.pingSettings.count,
                  onChanged: (it) {
                    final newSettings = settings.copyWith(
                      pingSettings: settings.pingSettings.copyWith(
                        count: it,
                      ),
                    );
                    _settingsStore.update(newSettings);
                  },
                ),
              ),
              _buildItem(
                _buildLabel("Packet size"),
                _buildIntValue(
                  settings.pingSettings.packetSize,
                  onChanged: (it) {
                    final newSettings = settings.copyWith(
                      pingSettings: settings.pingSettings.copyWith(
                        packetSize: it,
                      ),
                    );
                    _settingsStore.update(newSettings);
                  },
                ),
              ),
              _buildItem(
                _buildLabel("Send interval"),
                _buildIntValue(
                  settings.pingSettings.interval,
                  onChanged: (it) {
                    final newSettings = settings.copyWith(
                      pingSettings: settings.pingSettings.copyWith(
                        interval: it,
                      ),
                    );
                    _settingsStore.update(newSettings);
                  },
                ),
              ),
              _buildItem(
                _buildLabel("Timeout"),
                _buildIntValue(
                  settings.pingSettings.timeout,
                  onChanged: (it) {
                    final newSettings = settings.copyWith(
                      pingSettings: settings.pingSettings.copyWith(
                        timeout: it,
                      ),
                    );
                    _settingsStore.update(newSettings);
                  },
                ),
              ),
            ]),
            _buildItem(
              _buildLabel("Remember host"),
              Switch(
                value: settings.rememberHost,
                onChanged: (it) {
                  final newSettings = settings.copyWith(
                    rememberHost: it,
                  );
                  _settingsStore.update(newSettings);
                },
              ),
            ),
            _buildGroup("Results", [
              _buildItem(
                _buildLabel("Share results"),
                Switch(
                  value: settings.shareSettings.shareResults,
                  onChanged: (it) {
                    final newSettings = settings.copyWith(
                      shareSettings: settings.shareSettings.copyWith(
                        shareResults: it,
                      ),
                    );
                    _settingsStore.update(newSettings);
                  },
                ),
              ),
              _buildItem(
                _buildLabel(
                  "Attach location",
                  enabled: settings.shareSettings.shareResults,
                ),
                Switch(
                  value: settings.shareSettings.attachLocation,
                  onChanged: settings.shareSettings.shareResults
                      ? (it) {
                          final newSettings = settings.copyWith(
                            shareSettings: settings.shareSettings.copyWith(
                              attachLocation: it,
                            ),
                          );
                          _settingsStore.update(newSettings);
                        }
                      : null,
                ),
              ),
            ]),
            _buildItem(
              _buildLabel("System notification"),
              Switch(
                value: settings.showSystemNotification,
                onChanged: (it) {
                  final newSettings = settings.copyWith(
                    showSystemNotification: it,
                  );
                  _settingsStore.update(newSettings);
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: _buildItem(
                _buildLabel("Tutorial"),
                _buildTextValue(
                  "Show",
                  onTap: () => push(IntroPage()),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: _buildItem(
                _buildLabel("Version"),
                _buildTextValue(
                  "1.0.5",
                  onTap: () => push(ChangelogPage()),
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }

  Widget _buildGroup(String name, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: _buildLabel(name),
        ),
        ...children.map((it) => Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: it,
            ))
      ],
    );
  }

  Widget _buildLabel(String name, {bool enabled = true}) {
    return Text(
      name,
      style: TextStyle(
        color: enabled ? Colors.black : Colors.grey,
        fontSize: 18.0,
      ),
    );
  }

  Widget _buildItem(Widget title, Widget child) =>
      Row(children: [title, Spacer(), child]);

  Widget _buildIntValue(int value, {ValueChanged<int> onChanged}) {
    return _buildTextValue(
      value.toString(),
      onTap: () async {
        final newValue = await _showNumberPicker();
        if (newValue != null && newValue != value) {
          onChanged(newValue);
        }
      },
    );
  }

  Widget _buildTextValue(String value, {VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.0,
        height: 32.0,
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Future<int> _showNumberPicker() {
    int result;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(16.0),
        title: Text("Enter new value"),
        content: Container(
          width: 128.0,
          child: TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (it) => result = int.tryParse(it),
            keyboardType: TextInputType.number,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () => pop(result),
          ),
        ],
      ),
    );
  }
}
