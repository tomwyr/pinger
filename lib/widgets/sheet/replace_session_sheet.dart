import 'package:flutter/material.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/widgets/sheet/pinger_bottom_sheet.dart';

class ReplaceSessionSheet {
  static Future<void> show({
    @required BuildContext context,
    @required String currentHost,
    @required String newHost,
    @required VoidCallback onAcceptPressed,
  }) async {
    final subStyle = R.styles.bottomSheetSubitle;
    await PingerBottomSheet.show(
      context,
      title: Text(
        "Another session running",
        style: R.styles.bottomSheetTitle,
      ),
      subtitle: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Do you want to stop current session for ",
            style: subStyle,
          ),
          TextSpan(
            text: currentHost,
            style: subStyle.copyWith(color: R.colors.primaryLight),
          ),
          TextSpan(text: " and start new one for ", style: subStyle),
          TextSpan(
            text: currentHost,
            style: subStyle.copyWith(color: R.colors.primaryLight),
          ),
          TextSpan(text: String.fromCharCode(0x00A0) + "?", style: subStyle),
        ]),
      ),
      rejectLabel: "CANCEL",
      onAcceptPressed: onAcceptPressed,
    );
  }
}
