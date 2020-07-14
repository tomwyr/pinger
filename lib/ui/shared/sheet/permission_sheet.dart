import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/pinger_app.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';

class PermissionSheet {
  PermissionSheet({
    @required this.title,
    @required this.subtitle,
    @required this.openSettings,
    @required this.isSettingEnabled,
    @required this.updateSetting,
    @required this.isPermissionGranted,
  });

  final String title;
  final String subtitle;
  final VoidCallback openSettings;
  final ValueGetter<bool> isSettingEnabled;
  final ValueSetter<bool> updateSetting;
  final ValueGetter<bool> isPermissionGranted;

  bool _isShowingSheet = false;
  ReactionDisposer _disposer;

  void init() {
    _disposer = autorun((_) {
      if (!isSettingEnabled() && isPermissionGranted() && _isShowingSheet) {
        PingerApp.navigator.pop();
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
