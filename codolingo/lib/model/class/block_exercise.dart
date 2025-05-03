import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';

class CodolingoBlockExercise extends CodolingoExercise{

  List<CodolingoAnswerElement> propositions;
  List<CodolingoAnswerElement> responses;

  CodolingoBlockExercise(super.id, super.label, super.type, this.propositions, this.responses);
  
}