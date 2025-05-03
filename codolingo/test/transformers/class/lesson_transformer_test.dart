import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/lesson_type_enum.dart';
import 'package:codolingo/transformers/class/lesson_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CodolingoLessonTransformer transformer;

  setUp(() {
    transformer = CodolingoLessonTransformer();
  });

  test("invoke", () {
    // WHEN
    CodolingoLesson lesson = transformer.fromJson(LessonTransformerTestData.data);

    // THEN
    expect(lesson, equals(LessonTransformerTestData.transformedLesson));
  });

  test("invoke - list", () {
    // WHEN
    List<CodolingoLesson> lessons = transformer.fromListJson([LessonTransformerTestData.data]);

    // THEN
    expect(lessons, equals([LessonTransformerTestData.transformedLesson]));
  });

  test("invoke - error", () {
    // THEN
    expect(() => transformer.fromJson({}), throwsA(isA<TransformerException>()));
  });
}

class LessonTransformerTestData {
  static Map<String, dynamic> get data => {"id": 1, "label": "label", "type": "TRAINING", "nbStars": 1, "isUnlocked": true};
  static CodolingoLesson get transformedLesson => CodolingoLesson(1, "label", 1, true,  CodolingoLessonTypeEnum.training);
}
