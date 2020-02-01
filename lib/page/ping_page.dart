import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pinger/di/injector.dart';
import 'package:pinger/store/ping_store.dart';

class PingPage extends StatefulWidget {
  @override
  _PingPageState createState() => _PingPageState();
}

class _PingPageState extends State<PingPage> {
  final PingStore _pingStore = Injector.resolve();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => Center(
          child: Text(_pingStore.currentPing.host),
        ),
      ),
    );
  }
}
