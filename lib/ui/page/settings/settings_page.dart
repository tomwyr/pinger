import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/notification_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/common/scroll_edge_gradient.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/intro_page.dart';
import 'package:pinger/ui/page/settings/settings_sections.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseState<SettingsPage>
    with NotificationPermissionState {
  final SettingsStore _settingsStore = Injector.resolve();
  final NotificationStore _notificationStore = Injector.resolve();

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
        final appVersion = _settingsStore.appVersion;
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
              OtherSettingsSection(
                settings: settings,
                onChanged: _settingsStore.updateSettings,
              ),
              Container(height: 48.0),
              SettingsFooterSection(
                appVersion: appVersion,
                onShowIntroPressed: () => push(IntroPage()),
              ),
            ],
          ),
        );
      }),
    );
  }
}

mixin NotificationPermissionState<T extends StatefulWidget> on State<T> {
  SettingsStore get _settingsStore;
  NotificationStore get _notificationStore;

  bool _isShowingSheet = false;
  ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _disposer = autorun((_) {
      final hasPermission = _notificationStore.hasPermission;
      final showNotification =
          _settingsStore.userSettings.showSystemNotification;
      if (!showNotification && hasPermission == true && _isShowingSheet) {
        pop();
        _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith(
            showSystemNotification: true,
          ),
        );
      } else if (showNotification &&
          hasPermission == false &&
          !_isShowingSheet) {
        _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith(
            showSystemNotification: false,
          ),
        );
        _showMissingPermissionSheet();
      }
    });
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  void _showMissingPermissionSheet() async {
    _isShowingSheet = true;
    await Future(() => PingerBottomSheet.show(
          context,
          title: Text(
            "Notification permission disabled",
            style: R.styles.bottomSheetTitle,
          ),
          subtitle: Text(
            "Enable permission in app settings",
            style: R.styles.bottomSheetSubtitle,
          ),
          acceptIcon: Icons.settings,
          rejectLabel: S.current.cancelButtonLabel,
          onAcceptPressed: AppSettings.openNotificationSettings,
        ));
    _isShowingSheet = false;
  }
}
