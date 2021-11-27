import 'package:flutter/material.dart';

import 'package:pinger/di/injector.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/app/pinger_app.dart';
import 'package:pinger/ui/app/pinger_router.dart';
import 'package:pinger/ui/page/base_page.dart';

class InitPage extends StatefulWidget {
  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends BaseState<InitPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      PingerApp.router.show(RouteConfig.home());
      final hasSession = Injector.resolve<PingStore>().currentSession != null;
      if (hasSession) PingerApp.router.show(RouteConfig.session());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: R.colors.canvas);
  }
}
