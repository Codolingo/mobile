import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/model/class/linking_exercise.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:codolingo/transformers/class/answer_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';

class CodolingoExerciseTransformer {
  CodolingoAnswerElementTransformer answerElementTransformer;

  CodolingoExerciseTransformer(this.answerElementTransformer);

  CodolingoExercise fromJson(dynamic data) {
    try {
      if (data[CodolingoExercise.typeField] == CodolingoExerciseTypeEnum.mcqExercise.apiValue) {
        return fromMCQJson(data);
      } else {
        return fromLinkingJson(data);
      }
    } on Error catch (e) {
      throw MissingFieldTransformerException(e);
    }
  }

  CodolingoMCQExercise fromMCQJson(dynamic data) {
    return CodolingoMCQExercise(data[CodolingoExercise.idField], data[CodolingoExercise.labelField],
        answerElementTransformer.fromListJson(data[CodolingoMCQExercise.proposalsField]));
  }

  CodolingoLinkingExercise fromLinkingJson(dynamic data) {
    return CodolingoLinkingExercise(data[CodolingoExercise.idField], data[CodolingoExercise.labelField],
        answerElementTransformer.fromListJson(data[CodolingoLinkingExercise.proposalsField]));
  }

  List<CodolingoExercise> fromListJson(dynamic data) {
    print(data);
    List<dynamic> rawList = data as List<dynamic>;
    return rawList.map((dynamic rawCodolingoExercise) => fromJson(rawCodolingoExercise)).toList();
  }
}
