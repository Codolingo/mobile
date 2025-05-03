import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';

class CodolingoLinkingExercise extends CodolingoExercise {
  static const String proposalsField = "proposals";

  List<CodolingoAnswerElement> proposals;

  CodolingoLinkingExercise(int id, String label, this.proposals)
      : super(id, label, CodolingoExerciseTypeEnum.linkingExercise);
}
