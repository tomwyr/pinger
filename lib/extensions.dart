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

  Future<T> pushAndRemoveUntil<T>(Widget widget, RoutePredicate predicate) =>
      Navigator.of(context).pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => widget),
        predicate,
      );
}

extension ListExtensions<E> on List<E> {
  Iterable<T> mapIndexed<T>(T f(int i, E e)) {
    int index = -1;
    return map((e) => f(++index, e));
  }

  E get lastOrNull => isNotEmpty ? last : null;

  bool get isNullOrEmpty => this == null || isEmpty;
}
