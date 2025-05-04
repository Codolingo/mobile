import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:codolingo/repositories/lesson_repository.dart';
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
    initServices();
    initRepositories();
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

  initServices() {}

  initRepositories() {
    getIt.registerSingleton<ApiRepository>(ApiRepositoryImpl());
    getIt.registerSingleton<LessonRepository>(LessonRepositoryImpl());
  }
}
