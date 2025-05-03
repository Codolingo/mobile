import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/lesson.dart';

class CodolingoLessonWithExercises extends CodolingoLesson {
  List<CodolingoExercise> exercises;
  CodolingoLessonWithExercises(super.id, super.label, super.nbStars, super.isUnlocked, super.type, this.exercises);
}
