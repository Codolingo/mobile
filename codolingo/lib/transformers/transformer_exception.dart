import 'package:codolingo/utils/exceptions.dart';

abstract class TransformerException extends CodolingoException {
  TransformerException(super.name, super.message);
}

class MissingFieldTransformerException extends TransformerException {
  Error error;

  MissingFieldTransformerException(this.error)
      : super("MissingFieldTransformerException", error.stackTrace?.toString() ?? "No stacktrace");
}

class UnknownFieldTransformException extends TransformerException {
  String field;

  UnknownFieldTransformException(this.field)
      : super("UnknownFieldTransformException", "Unknown field: $field");
}
