import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/location_store.dart';
import 'package:pinger/store/notification_store.dart';
import 'package:pinger/store/settings_store.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';

class PermissionsSheet extends StatefulWidget {
  final Widget child;

  const PermissionsSheet({Key key, @required this.child}) : super(key: key);

  @override
  _PermissionsSheetState createState() => _PermissionsSheetState();
}

class _PermissionsSheetState extends State<PermissionsSheet> {
  final SettingsStore _settingsStore = Injector.resolve();
  final NotificationStore _notificationStore = Injector.resolve();
  final LocationStore _locationStore = Injector.resolve();

  List<PermissionSheetHandler> _handlers;

  PermissionSheetHandler get _notificationHandler => PermissionSheetHandler(
        title: "Notification permission disabled",
        subtitle: "Enable permission in app settings",
        openSettings: AppSettings.openNotificationSettings,
        getContext: () => context,
        isPermissionGranted: () => _notificationStore.hasPermission,
        isSettingEnabled: () =>
            _settingsStore.userSettings.showSystemNotification,
        updateSetting: (value) => _settingsStore.updateSettings(
          _settingsStore.userSettings.copyWith(
            showSystemNotification: value,
          ),
        ),
      );

  PermissionSheetHandler get _locationHandler => PermissionSheetHandler(
        title: "Location access disabled",
        subtitle: "Enable permission and service in app settings",
        openSettings: AppSettings.openLocationSettings,
        getContext: () => context,
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
    _handlers = [_notificationHandler, _locationHandler]
      ..forEach((it) => it.init());
  }

  @override
  void dispose() {
    _handlers.forEach((it) => it.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class PermissionSheetHandler {
  PermissionSheetHandler({
    @required this.title,
    @required this.subtitle,
    @required this.openSettings,
    @required this.getContext,
    @required this.isSettingEnabled,
    @required this.updateSetting,
    @required this.isPermissionGranted,
  });

  final String title;
  final String subtitle;
  final VoidCallback openSettings;
  final ValueGetter<BuildContext> getContext;
  final ValueGetter<bool> isSettingEnabled;
  final ValueSetter<bool> updateSetting;
  final ValueGetter<bool> isPermissionGranted;

  bool _isShowingSheet = false;
  ReactionDisposer _disposer;

  void init() {
    _disposer = autorun((_) {
      if (!isSettingEnabled() && isPermissionGranted() && _isShowingSheet) {
        Navigator.pop(getContext());
        updateSetting(true);
      } else if (isSettingEnabled() &&
          !isPermissionGranted() &&
          !_isShowingSheet) {
        updateSetting(false);
        _showSheet();
      }
    });
  }

  void dispose() => _disposer();

  void _showSheet() async {
    _isShowingSheet = true;
    await Future(() => PingerBottomSheet.show(
          getContext(),
          title: Text(
            title,
            style: R.styles.bottomSheetTitle,
          ),
          subtitle: Text(
            subtitle,
            style: R.styles.bottomSheetSubtitle,
          ),
          acceptIcon: Icons.settings,
          rejectLabel: S.current.cancelButtonLabel,
          onAcceptPressed: openSettings,
        ));
    _isShowingSheet = false;
  }
}
