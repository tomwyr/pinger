import 'package:flutter/material.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/page/home_page.dart';
import 'package:pinger/page/ping_page.dart';
import 'package:pinger/store/ping_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.configure();
  runApp(PingerApp());
}

class PingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinger',
      home: Injector.resolve<PingStore>().currentSession != null
          ? PingPage()
          : HomePage(),
    );
  }
}
