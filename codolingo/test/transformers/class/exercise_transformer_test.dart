import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:codolingo/transformers/class/answer_transformer.dart';
import 'package:codolingo/transformers/class/exercise_transformer.dart';
import 'package:codolingo/transformers/transformer_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exercise_transformer_test.mocks.dart';

@GenerateMocks([CodolingoAnswerElementTransformer])
void main() {
  late CodolingoExerciseTransformer transformer;
  late CodolingoAnswerElementTransformer answerTransformer;

  setUp(() {
    answerTransformer = MockCodolingoAnswerElementTransformer();
    when(answerTransformer.fromListJson([ExerciseTransformerTestData.choice1, ExerciseTransformerTestData.choice2]))
        .thenReturn([
      ExerciseTransformerTestData.transformedAnswerChoice1,
      ExerciseTransformerTestData.transformedAnswerChoice2
    ]);

    transformer = CodolingoExerciseTransformer(answerTransformer);
  });

  test("invoke - mcq", () {
    // WHEN
    CodolingoExercise exercise = transformer.fromJson(ExerciseTransformerTestData.mcqData);

    // THEN
    expect(exercise, equals(ExerciseTransformerTestData.transformedMcqExercise));
  });

  test("invoke - list", () {
    // WHEN
    List<CodolingoExercise> exercises = transformer.fromListJson([ExerciseTransformerTestData.mcqData]);

    // THEN
    expect(exercises, equals([ExerciseTransformerTestData.transformedMcqExercise]));
  });

  test("invoke - error", () {
    // THEN
    expect(() => transformer.fromJson({}), throwsA(isA<TransformerException>()));
  });
}

class ExerciseTransformerTestData {
  static Map<String, dynamic> get mcqData => {
        "id": 14563,
        "label": "Question 1",
        "type": CodolingoExerciseTypeEnum.mcqExercise.apiValue,
        "proposals": [
            {
                "id": 1,
                "content": "Proposition 1"
            },
            {
                "id": 2,
                "content": "Proposition 2"
            },
        ]
    };

  static Map<String, dynamic> get trainingData => {
        "id": "id",
        "label": "label",
        "type": CodolingoExerciseTypeEnum.linkingExercise.apiValue,
        "proposals": [choice1, choice2]
      };

  static Map<String, dynamic> get choice1 => {
        "id": 1,
        "content": "Proposition 1",
      };

  static Map<String, dynamic> get choice2 => {
        "id": 2,
        "content": "Proposition 2",
      };

  static CodolingoAnswerElement get transformedAnswerChoice1 => CodolingoAnswerElement(1, "Proposition 1");
  static CodolingoAnswerElement get transformedAnswerChoice2 => CodolingoAnswerElement(2, "Proposition 2");

  static CodolingoMCQExercise get transformedMcqExercise =>
      CodolingoMCQExercise(14563, "Question 1", [transformedAnswerChoice1, transformedAnswerChoice2]);
}
