import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';

class CodolingoComparatingExercise extends CodolingoExercise {

  List<CodolingoAnswerElement> propositions;
  CodolingoAnswerElement response;

  CodolingoComparatingExercise(super.id, super.label, super.type, this.propositions, this.response);
  
}