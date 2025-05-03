import 'package:codolingo/model/class/lesson_type_enum.dart';

class CodolingoLesson{
  static const String idField = "id";
  static const String labelField = "label";
  static const String nbStarsField = "nbStars";
  static const String isUnlockedField = "isUnlocked";
  static const String typeField = "type";

  int id;
  String label;
  int nbStars;
  bool isUnlocked;
  CodolingoLessonTypeEnum type;

  CodolingoLesson(this.id, this.label, this.nbStars, this.isUnlocked, this.type);


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodolingoLesson &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          type == other.type &&
          nbStars == other.nbStars &&
          isUnlocked == other.isUnlocked;
}