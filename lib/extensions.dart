import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension StateExtensions<T extends StatefulWidget> on State<T> {
  Future<T> push<T>(Widget widget) =>
      Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => widget));

  bool pop<T>([T result]) => Navigator.of(context).pop<T>(result);

  // ignore: invalid_use_of_protected_member
  void rebuild() => setState(() {});
}
