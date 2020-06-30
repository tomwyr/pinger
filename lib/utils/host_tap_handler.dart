import 'package:flutter/cupertino.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/page/session/session_page.dart';
import 'package:pinger/ui/shared/sheet/replace_session_sheet.dart';

mixin HostTapHandler<T extends StatefulWidget> on State<T> {
  void onHostTap(PingStore pingStore, String newHost) {
    final status = pingStore.currentSession?.status;
    final host = pingStore.currentSession?.host;
    if (status.isNull || status.isInitial || status.isDone) {
      pingStore.initSession(newHost);
      _showPingPage();
    } else if (host == newHost) {
      _showPingPage();
    } else {
      ReplaceSessionSheet.show(
        context: context,
        currentHost: host,
        newHost: newHost,
        onAcceptPressed: () {
          pingStore.initSession(newHost);
          _showPingPage();
        },
      );
    }
  }

  void _showPingPage() =>
      pushAndRemoveUntil(PingPage(), (route) => route.isFirst);
}
