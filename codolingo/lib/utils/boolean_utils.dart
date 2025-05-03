extension BooleanUtilsNullable on bool? {
  bool get orTrue => this ?? true;
  bool get orFalse => this ?? false;
}