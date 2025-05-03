import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';

class CodolingoInputExercise extends CodolingoExercise{

  CodolingoAnswerElement response;

  CodolingoInputExercise(super.id, super.label, super.type, this.response);
  
}