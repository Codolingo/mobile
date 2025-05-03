import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/lesson_type_enum.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoLessonTransformer {
  CodolingoLesson fromJson(dynamic data) {
    try {
      return CodolingoLesson(
          data[CodolingoLesson.idField],
          data[CodolingoLesson.labelField],
          data[CodolingoLesson.nbStarsField] ?? 0,
          data[CodolingoLesson.isUnlockedField] ?? true,
          CodolingoLessonTypeTransformer().fromType(data[CodolingoLesson.typeField]));
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  List<CodolingoLesson> fromListJson(dynamic data) {
    List<dynamic> rawList = data as List<dynamic>;
    return rawList.map((dynamic rawCodolingoLesson) => fromJson(rawCodolingoLesson)).toList();
  }
}

class CodolingoLessonTypeTransformer {
  CodolingoLessonTypeEnum fromType(String id) {
    switch (id) {
      case "TRAINING":
        return CodolingoLessonTypeEnum.training;
      case "ASSESSMENT":
        return CodolingoLessonTypeEnum.assessment;
      default:
        throw UnknownFieldTransformException(id);
    }
  }
}
