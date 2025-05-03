import 'package:codolingo/model/api/answer_result.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoAnswerResultTransformer {
  CodolingoAnswerResult fromJson(CodolingoExerciseTypeEnum type, dynamic data) {
    print(data);
    switch (type) {
      case CodolingoExerciseTypeEnum.mcqExercise:
        return fromMCQJson(data);
      case CodolingoExerciseTypeEnum.linkingExercise:
        return fromLinkingJson(data);
      default:
        throw UnknownFieldTransformException(type.name);
    }
  }

  CodolingoMCQAnswerResult fromMCQJson(dynamic data) {
    try {
      return CodolingoMCQAnswerResult(data[CodolingoAnswerResult.answerField][0][CodolingoAnswerResult.answerFieldId], 
          explanation : data[CodolingoAnswerResult.explanationField] ?? "");
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }

  CodolingoLinkingAnswerResult fromLinkingJson(dynamic data) {
    try {
      print(data[CodolingoAnswerResult.answerField]
          .map<List<int>>(
              (dynamic rawList) => rawList.map<int>((dynamic rawElement) => rawElement["id"] as int).toList() as List<int>)
          .toList());
      return CodolingoLinkingAnswerResult(
        data[CodolingoAnswerResult.answerField]
            .map<List<int>>(
                (dynamic rawList) => rawList.map<int>((dynamic rawElement) => rawElement["id"] as int).toList() as List<int>)
            .toList(),
        explanation: data[CodolingoAnswerResult.explanationField] ?? "",
      );
    } on Error catch (e) {
      print(e);
      throw MissingFieldTransformerException(e);
    }
  }
}
