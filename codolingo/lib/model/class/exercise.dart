import 'package:codolingo/model/class/exercise_type_enum.dart';

abstract class CodolingoExercise {
  static const String idField = "id";
  static const String labelField = "label";
  static const String typeField = "type";

  int id;
  String label;
  CodolingoExerciseTypeEnum type;

  CodolingoExercise(this.id, this.label, this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodolingoExercise &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          type == other.type;
}
