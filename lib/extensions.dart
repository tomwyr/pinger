extension IterableExtensions<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T f(int i, E e)) {
    int index = -1;
    return map((e) => f(++index, e));
  }

  E get lastOrNull => isNotEmpty ? last : null;

  bool get isNullOrEmpty => this == null || isEmpty;
}
