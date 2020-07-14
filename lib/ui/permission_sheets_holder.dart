import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/notification_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/shared/sheet/permission_sheet.dart';

class PermissionSheetsHolder extends StatefulWidget {
  final Widget child;

  const PermissionSheetsHolder({Key key, @required this.child})
      : super(key: key);

  @override
  _PermissionSheetsHolderState createState() => _PermissionSheetsHolderState();
}

class _PermissionSheetsHolderState extends State<PermissionSheetsHolder> {
  final SettingsStore _settingsStore = Injector.resolve();
  final NotificationStore _notificationStore = Injector.resolve();
  final LocationStore _locationStore = Injector.resolve();

  List<PermissionSheet> _sheets;

  PermissionSheet get _notificationSheet => PermissionSheet(
        title: "Notification permission disabled",
        subtitle: "Enable permission in app settings",
        openSettings: AppSettings.openNotificationSettings,
        isPermissionGranted: () => _notificationStore.hasPermission,
        isSettingEnabled: () =>
            _settingsStore.userSettings.showSystemNotification,
        updateSetting: (value) => _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith(
            showSystemNotification: value,
          ),
        ),
      );

  PermissionSheet get _locationSheet => PermissionSheet(
        title: "Location access disabled",
        subtitle: "Enable permission and service in app settings",
        openSettings: AppSettings.openLocationSettings,
        isPermissionGranted: () => _locationStore.canAccessLocation,
        isSettingEnabled: () =>
            _settingsStore.userSettings.shareSettings.attachLocation,
        updateSetting: (value) => _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith.shareSettings(
            attachLocation: value,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    _sheets = [_notificationSheet, _locationSheet]..forEach((it) => it.init());
  }

  @override
  void dispose() {
    _sheets.forEach((it) => it.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
