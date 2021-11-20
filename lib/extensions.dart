extension IterableExtensions<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T f(int i, E e)) {
    int index = -1;
    return map((e) => f(++index, e));
  }

  E? get lastOrNull => isNotEmpty ? last : null;
}

extension NullableTypeIterableExtensions<E> on Iterable<E?> {
  Iterable<E> whereNotNull() sync* {
    for (final e in this) {
      if (e != null) yield e;
    }
  }
}

extension NullableIterableExtensions<E> on Iterable<E>? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}
