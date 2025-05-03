import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoAnswerElementTransformer {
  CodolingoAnswerElement fromJson(dynamic data) {
    try {
      return CodolingoAnswerElement(data[CodolingoAnswerElement.idField], data[CodolingoAnswerElement.contentField]);
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  List<CodolingoAnswerElement> fromListJson(dynamic data) {
    List<dynamic> rawList = data as List<dynamic>;
    return rawList.map((dynamic rawCodolingoAnswer) => fromJson(rawCodolingoAnswer)).toList();
  }
}
