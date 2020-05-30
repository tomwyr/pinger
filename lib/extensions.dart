import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension StateExtensions<T extends StatefulWidget> on State<T> {
  Future<T> push<T>(Widget widget) =>
      Navigator.of(context).push<T>(MaterialPageRoute(builder: (_) => widget));

  void pop<T>([T result]) => Navigator.of(context).pop<T>(result);

  Future<T> pushReplacement<T, R>(Widget widget, {R result}) =>
      Navigator.of(context).pushReplacement<T, R>(
        MaterialPageRoute(builder: (_) => widget),
        result: result,
      );

  Future<T> pushAndRemoveUntil(Widget widget, RoutePredicate predicate) =>
      Navigator.of(context).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => widget),
        predicate,
      );

  // ignore: invalid_use_of_protected_member
  void rebuild() => setState(() {});
}
