import 'package:flutter/material.dart';

void main() => runApp(PingerApp());

class PingerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinger',
      home: Scaffold(
        appBar: AppBar(title: Text('Pinger')),
        body: Center(child: Text('Pinger')),
      ),
    );
  }
}
