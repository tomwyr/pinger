import 'package:flutter/cupertino.dart';
import 'package:pinger/model/ping_session.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/shared/sheet/replace_session_sheet.dart';

mixin HostTapHandler<T extends StatefulWidget> on State<T> {
  void onHostTap(PingStore pingStore, String newHost) {
    final status = pingStore.currentSession?.status;
    final host = pingStore.currentSession?.host;
    if (host == newHost) {
      _showPingPage();
    } else if (status.isNull || status.isInitial || status.isSessionDone) {
      pingStore.initSession(newHost);
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

  void _showPingPage() => PingerApp.router.show(RouteConfig.session());
}
