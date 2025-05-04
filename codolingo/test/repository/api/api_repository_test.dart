// ignore_for_file: unused_local_variable

import 'package:codolingo/services/api/api_service.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:codolingo/transformers/class/chapter_transformer.dart';
import 'package:codolingo/transformers/class/exercise_transformer.dart';
import 'package:codolingo/transformers/class/lesson_transformer.dart';
import 'package:codolingo/transformers/class/module_transformer.dart';
import 'package:codolingo/transformers/class/theme_transformer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'api_repository_test.mocks.dart';

@GenerateMocks([
  ApiService,
  CodolingoThemeTransformer,
  CodolingoChapterTransformer,
  CodolingoModuleTransformer,
  CodolingoLessonTransformer,
  CodolingoExerciseTransformer
])
void main() {
  late ApiRepository apiRepository;

  late ApiService apiService;
  late CodolingoThemeTransformer codolingoThemeTransformer;
  late CodolingoChapterTransformer codolingoChapterTransformer;
  late CodolingoModuleTransformer codolingoModuleTransformer;
  late CodolingoLessonTransformer codolingoLessonTransformer;
  late CodolingoExerciseTransformer codolingoExerciseTransformer;

  setUp(() {
    apiService = MockApiService();
    codolingoThemeTransformer = MockCodolingoThemeTransformer();
    codolingoChapterTransformer = MockCodolingoChapterTransformer();
    codolingoModuleTransformer = MockCodolingoModuleTransformer();
    codolingoLessonTransformer = MockCodolingoLessonTransformer();
    codolingoExerciseTransformer = MockCodolingoExerciseTransformer();
  });

  // TODO : Do tests when the class is bigger
}
