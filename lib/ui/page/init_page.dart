import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/ping_store.dart';
import 'package:pinger/ui/page/base_page.dart';
import 'package:pinger/ui/page/home/home_page.dart';
import 'package:pinger/ui/page/session/session_page.dart';

class InitPage extends StatefulWidget {
  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends BaseState<InitPage> {
  @override
  void initState() {
    super.initState();
    Future(() {
      pushReplacement(HomePage());
      final hasSession = Injector.resolve<PingStore>().currentSession != null;
      if (hasSession) push(PingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: R.colors.canvas);
  }
}
