import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoChapterTransformer {
  CodolingoChapter fromJson(dynamic data) {
    try {
      return CodolingoChapter(data[CodolingoChapter.idField], data[CodolingoChapter.labelField],
          true, [], null);
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  List<CodolingoChapter> fromListJson(dynamic data) {
    List<dynamic> rawList = data as List<dynamic>;
    return rawList.map((dynamic rawCodolingoChapter) => fromJson(rawCodolingoChapter)).toList();
  }
}
