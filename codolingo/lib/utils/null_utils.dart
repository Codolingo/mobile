extension NullUtils<T> on T? {
  T or(T value) {
    return this ?? value;
  }

  /// Do the function in [block] if the object is not null
  Y? let<Y>(Y Function(T) block) {
    if (this != null) {
      return block(this!);
    }
    return null;
  }
}
