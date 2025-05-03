import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoThemeTransformer {
  CodolingoTheme fromJson(Map<String, dynamic> data) {
    try {
      print(data);
      return CodolingoTheme(data[CodolingoTheme.idField], data[CodolingoTheme.labelField], []);
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  List<CodolingoTheme> fromListJson(List<dynamic> data) {
    List<dynamic> rawList = data;
    return rawList.map((dynamic rawCodolingoTheme) => fromJson(rawCodolingoTheme)).toList();
  }
}
