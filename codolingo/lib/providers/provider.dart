import 'package:codolingo/services/api/api_service.dart';
import 'package:codolingo/services/lesson_service.dart';
import 'package:codolingo/transformers/class/answer_transformer.dart';
import 'package:codolingo/transformers/class/chapter_transformer.dart';
import 'package:codolingo/transformers/class/end_lesson_result_transformer.dart';
import 'package:codolingo/transformers/class/exercise_transformer.dart';
import 'package:codolingo/transformers/class/lesson_transformer.dart';
import 'package:codolingo/transformers/class/module_transformer.dart';
import 'package:codolingo/transformers/class/theme_transformer.dart';
import 'package:get_it/get_it.dart';

class CodolingoProvider {
  final getIt = GetIt.instance;

  CodolingoProvider() {
    initTransformers();
    initRepositories();
    initServices();
  }

  initTransformers() {
    getIt.registerSingleton<CodolingoThemeTransformer>(CodolingoThemeTransformer());
    getIt.registerSingleton<CodolingoChapterTransformer>(CodolingoChapterTransformer());
    getIt.registerSingleton<CodolingoModuleTransformer>(CodolingoModuleTransformer());
    getIt.registerSingleton<CodolingoLessonTransformer>(CodolingoLessonTransformer());
    getIt.registerSingleton<CodolingoAnswerElementTransformer>(CodolingoAnswerElementTransformer());
    getIt.registerSingleton<CodolingoExerciseTransformer>(CodolingoExerciseTransformer(
      getIt.get<CodolingoAnswerElementTransformer>(),
    ));
    getIt.registerSingleton<EndLessonResultTransformer>(EndLessonResultTransformer());
  }

  initRepositories() {}

  initServices() {
    getIt.registerSingleton<ApiService>(ApiServiceImpl());
    getIt.registerSingleton<LessonService>(LessonServiceImpl());
  }
}
