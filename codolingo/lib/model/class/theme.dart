import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/utils/list_utils.dart';

class CodolingoTheme {
  static const String idField = "id";
  static const String labelField = "label";
  static const String chaptersField = "chapters";

  int id;
  String label;
  List<CodolingoChapter> chapters;

  CodolingoTheme(this.id, this.label, this.chapters);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodolingoTheme &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          chapters.length == other.chapters.length &&
          chapters.everyIndex((int index) => chapters[index] == other.chapters[index]);
}
