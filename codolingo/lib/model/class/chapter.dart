import 'package:codolingo/model/class/module.dart';
import 'package:codolingo/utils/list_utils.dart';

class CodolingoChapter {
  static const String idField = "id";
  static const String labelField = "label";
  static const String isUnlockedField = "isUnlocked";

  int id;
  String label;
  bool isUnlocked = false;
  List<CodolingoModule> modules;
  CodolingoChapter? previousChapter;

  CodolingoChapter(this.id, this.label, this.isUnlocked, this.modules, this.previousChapter);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodolingoChapter &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          modules.length == other.modules.length &&
          modules.everyIndex((int index) => modules[index] == other.modules[index]) &&
          previousChapter == other.previousChapter &&
          isUnlocked == other.isUnlocked;
}
