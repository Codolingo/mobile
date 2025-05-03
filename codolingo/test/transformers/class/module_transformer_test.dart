import 'package:codolingo/model/class/module.dart';
import 'package:codolingo/transformers/class/module_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late CodolingoModuleTransformer transformer;

  setUp(() {
    transformer = CodolingoModuleTransformer();
  });

  test("invoke", () {
    // WHEN
    CodolingoModule modules = transformer.fromJson(ModuleTransformerTestData.data);

    // THEN
    expect(modules, equals(ModuleTransformerTestData.transformedModule));
  });

  test("invoke - list", () {
    // WHEN
    List<CodolingoModule> modules = transformer.fromListJson([ModuleTransformerTestData.data]);

    // THEN
    expect(modules, equals([ModuleTransformerTestData.transformedModule]));
  });

  test("invoke - error", () {
    // THEN
    expect(() => transformer.fromJson({}), throwsA(isA<TransformerException>()));
  });
}

class ModuleTransformerTestData {
  static Map<String, dynamic> get data => {"id": 1, "label": "label", "lessons": [], "nbStarsToUnlock": 5, "isUnlocked": true};
  static CodolingoModule get transformedModule => CodolingoModule(1, "label", 5, true, [], null);
}
