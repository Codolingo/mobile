import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/transformers/class/chapter_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CodolingoChapterTransformer transformer;
  setUp(() {
    transformer = CodolingoChapterTransformer();
  });

  test("invoke", () {
    // WHEN
    CodolingoChapter chapter = transformer.fromJson(ChapterTransformerTestData.data);

    // THEN
    expect(chapter, equals(ChapterTransformerTestData.transformedChapter));
  });

  test("invoke - list", () {
    // WHEN
    List<CodolingoChapter> chapters = transformer.fromListJson([ChapterTransformerTestData.data]);

    // THEN
    expect(chapters, equals([ChapterTransformerTestData.transformedChapter]));
  });

  test("invoke - error", () {
    // THEN
    expect(() => transformer.fromJson({}), throwsA(isA<TransformerException>()));
  });
}

class ChapterTransformerTestData {
  static Map<String, dynamic> get data => {"id": 1, "label": "Premier chapitre de Java", "isUnlocked": true};
  static CodolingoChapter get transformedChapter => CodolingoChapter(1, "Premier chapitre de Java", true, [], null);
}
