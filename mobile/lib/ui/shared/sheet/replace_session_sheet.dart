import 'package:flutter/material.dart';

import 'package:pinger/generated/l10n.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/ui/shared/sheet/pinger_bottom_sheet.dart';

class ReplaceSessionSheet {
  static Future<void> show({
    required BuildContext context,
    required String currentHost,
    required String newHost,
    required VoidCallback onAcceptPressed,
  }) async {
    final subStyle = R.styles.bottomSheetSubtitle;
    final subPaths = S.current
        .replaceSessionSheetSubtitle(currentHost, newHost)
        .split(RegExp("($currentHost|$newHost)"));
    await PingerBottomSheet.show(
      title: Text(
        S.current.replaceSessionSheetTitle,
        style: R.styles.bottomSheetTitle,
      ),
      subtitle: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: subPaths[0],
            style: subStyle,
          ),
          TextSpan(
            text: currentHost,
            style: subStyle.copyWith(color: R.colors.primaryLight),
          ),
          TextSpan(text: subPaths[1], style: subStyle),
          TextSpan(
            text: newHost,
            style: subStyle.copyWith(color: R.colors.primaryLight),
          ),
          TextSpan(text: subPaths[2], style: subStyle),
        ]),
      ),
      rejectLabel: S.current.cancelButtonLabel,
      onAcceptPressed: onAcceptPressed,
    );
  }
}
