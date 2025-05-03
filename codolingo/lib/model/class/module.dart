import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/utils/list_utils.dart';

class CodolingoModule {
  static const String idField = "id";
  static const String labelField = "label";
  static const String nbStarsToUnlockField = "nbStarsToUnlock";
  static const String isUnlockedField = "isUnlocked";
  static const String lessonsField = "lessons";
  static const String previousModuleField = "previousModule";

  int id;
  String label;
  int nbStarsToUnlock;
  bool isUnlocked;
  List<CodolingoLesson> lessons;
  CodolingoModule? previousModule;

  CodolingoModule(this.id, this.label, this.nbStarsToUnlock, this.isUnlocked, this.lessons, this.previousModule);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodolingoModule &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          lessons.length == other.lessons.length &&
          lessons.everyIndex((int index) => lessons[index] == other.lessons[index]) &&
          previousModule == other.previousModule &&
          nbStarsToUnlock == other.nbStarsToUnlock &&
          isUnlocked == other.isUnlocked;

}
