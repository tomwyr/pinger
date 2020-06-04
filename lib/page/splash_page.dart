import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/home_page.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/resources.dart';
import 'package:pinger/store/ping_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  void _initAsync() async {
    await Injector.configure();
    final pingStore = Injector.resolve<PingStore>();
    autorun((reaction) {
      if (pingStore.didInit) {
        reaction.dispose();
        pushReplacement(HomePage());
        if (pingStore.currentSession != null) push(PingPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(color: R.colors.canvas);
  }
}
