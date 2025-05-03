import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/transformers/class/theme_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CodolingoThemeTransformer transformer;

  setUp(() {
    transformer = CodolingoThemeTransformer();
  });

  test("invoke", () {
    // WHEN
    CodolingoTheme theme = transformer.fromJson(ThemeTransformerTestData.data);

    // THEN
    expect(theme, equals(ThemeTransformerTestData.transformedTheme));
  });

  test("invoke - list", () {
    // WHEN
    List<CodolingoTheme> themes = transformer.fromListJson([ThemeTransformerTestData.data]);

    // THEN
    expect(themes, equals([ThemeTransformerTestData.transformedTheme]));
  }); 

  test("invoke - error", () {
    // THEN
    expect(() => transformer.fromJson({}), throwsA(isA<TransformerException>()));
  });
}

class ThemeTransformerTestData {
  static Map<String, dynamic> get data => {"id": 1, "label": "label", "chapters": []};
  static CodolingoTheme get transformedTheme => CodolingoTheme(1, "label", []);
}
