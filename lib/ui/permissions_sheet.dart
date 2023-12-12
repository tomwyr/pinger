import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/permission_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';

class PermissionsSheet extends StatefulWidget {
  const PermissionsSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<PermissionsSheet> createState() => _PermissionsSheetState();
}

class _PermissionsSheetState extends State<PermissionsSheet> {
  late List<PermissionSheetHandler> _handlers;

  PermissionSheetHandler get _notificationHandler => PermissionSheetHandler(
        title: S.current.notificationAccessDisabledTitle,
        subtitle: S.current.notificationAccessDisabledDesc,
        openSettings: () => AppSettings.openAppSettings(
          type: AppSettingsType.notification,
        ),
        store: Injector.resolve(PermissionStore.notification),
      );

  PermissionSheetHandler get _locationHandler => PermissionSheetHandler(
        title: S.current.locationAccessDisabledTitle,
        subtitle: S.current.locationAccessDisabledDesc,
        openSettings: () => AppSettings.openAppSettings(
          type: AppSettingsType.location,
        ),
        store: Injector.resolve(PermissionStore.location),
      );

  @override
  void initState() {
    super.initState();
    _handlers = [_notificationHandler, _locationHandler]..forEach((it) => it.init());
  }

  @override
  void dispose() {
    for (var it in _handlers) {
      it.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class PermissionSheetHandler {
  PermissionSheetHandler({
    required this.title,
    required this.subtitle,
    required this.openSettings,
    required this.store,
  });

  final String title;
  final String subtitle;
  final VoidCallback openSettings;
  final PermissionStore store;

  bool _isShowingSheet = false;
  late ReactionDisposer _disposer;

  void init() {
    _disposer = autorun((_) {
      if (store.didRejectSetting) {
        if (!store.canAccessService && !_isShowingSheet) {
          _showSheet();
        } else if (store.canAccessService && _isShowingSheet) {
          PingerApp.router.pop();
        }
      }
    });
  }

  void dispose() => _disposer();

  void _showSheet() async {
    _isShowingSheet = true;
    await Future.delayed(Duration.zero);
    await PingerBottomSheet.show(
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
    );
    store.notifyHandledRejection();
    _isShowingSheet = false;
  }
}
