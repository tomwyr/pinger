import 'package:flutter/material.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/page/archive_page.dart';
import 'package:pinger/page/settings_page.dart';

mixin PingerAppBar<T extends StatefulWidget> on State<T> {
  AppBar buildAppBar({double elevation = 4.0}) {
    return AppBar(
      elevation: elevation,
      leading: IconButton(
        icon: Icon(Icons.tune),
        onPressed: () => push(SettingsPage()),
      ),
      title: Text("Pinger"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.unarchive),
          onPressed: () => push(ArchivePage()),
        ),
      ],
    );
  }
}
