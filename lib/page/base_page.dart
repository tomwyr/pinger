import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reference theme in order to rebuild when app changes to dark/light mode
    Theme.of(context);
  }
}
