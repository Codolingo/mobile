extension ListExtension<E> on List<E> {
  bool everyIndex(bool test(int index)) {
    for (int i = 0; i < length; i++){
      if (!test(i)) return false;
    }
    return true;
  }
}

extension NullableListExtension<E> on List<E>? {
  /// FirstWhereOrNull
  E? firstWhereOrNull(bool Function(E element) test) {
    if (this == null) return null;
    for (E element in this!) {
      if (test(element)) return element;
    }
    return null;
  }
}