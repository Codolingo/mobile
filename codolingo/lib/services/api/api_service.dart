import 'dart:convert';

import 'package:codolingo/model/api/answer_result.dart';
import 'package:codolingo/model/api/end_lesson_result.dart';
import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/login_response.dart';
import 'package:codolingo/model/class/module.dart';
import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:codolingo/transformers/class/answer_result_transformer.dart';
import 'package:codolingo/transformers/class/chapter_transformer.dart';
import 'package:codolingo/transformers/class/end_lesson_result_transformer.dart';
import 'package:codolingo/transformers/class/exercise_transformer.dart';
import 'package:codolingo/transformers/class/lesson_transformer.dart';
import 'package:codolingo/transformers/class/module_transformer.dart';
import 'package:codolingo/transformers/class/theme_transformer.dart';
import 'package:get_it/get_it.dart';

abstract class ApiService {
  /// Get the themes available
  Future<List<CodolingoTheme>> getThemes();

  /// Get the chapters from a [themeId]
  Future<List<CodolingoChapter>> getChapters(int themeId);

  /// Get the modules from a [chapterId]
  Future<List<CodolingoModule>> getModules(int chapterId);

  /// Get the lessons from a [moduleId]
  Future<List<CodolingoLesson>> getLessons(int moduleId);

  /// Get random exercises from a [lessonId]
  Future<List<CodolingoExercise>> startLesson(int lessonId);

  /// End a lesson with id [lessonId]
  Future<EndLessonResult> endLesson(int lessonId);

  /// Get the first exercises
  Future<List<CodolingoExercise>> getFirstExercises();

  /// Answer a question with id [questionId] and answer [answer]
  Future<CodolingoAnswerResult> answerQuestion(CodolingoExerciseTypeEnum type, int questionId, dynamic answer);

  /// Get token [token] with expiration [expiresIn] after authentication
  Future<bool> login(String username, String password);
}

class ApiServiceImpl implements ApiService {
  final getIt = GetIt.instance;

  late ApiRepository apiRepository;
  late CodolingoThemeTransformer themeTransformer;
  late CodolingoChapterTransformer chapterTransformer;
  late CodolingoModuleTransformer moduleTransformer;
  late CodolingoLessonTransformer lessonTransformer;
  late CodolingoExerciseTransformer exerciseTransformer;
  late EndLessonResultTransformer endLessonResultTransformer;

  ApiServiceImpl({
    ApiRepository? apiRepository,
    CodolingoThemeTransformer? themeTransformer,
    CodolingoChapterTransformer? chapterTransformer,
    CodolingoModuleTransformer? moduleTransformer,
    CodolingoLessonTransformer? lessonTransformer,
    CodolingoExerciseTransformer? exerciseTransformer,
    EndLessonResultTransformer? endLessonResultTransformer,
  }) {
    this.apiRepository = apiRepository ?? getIt.get<ApiRepository>();
    this.themeTransformer = themeTransformer ?? getIt.get<CodolingoThemeTransformer>();
    this.chapterTransformer = chapterTransformer ?? getIt.get<CodolingoChapterTransformer>();
    this.moduleTransformer = moduleTransformer ?? getIt.get<CodolingoModuleTransformer>();
    this.lessonTransformer = lessonTransformer ?? getIt.get<CodolingoLessonTransformer>();
    this.exerciseTransformer = exerciseTransformer ?? getIt.get<CodolingoExerciseTransformer>();
    this.endLessonResultTransformer = endLessonResultTransformer ?? getIt.get<EndLessonResultTransformer>();
  }

  @override
  Future<List<CodolingoTheme>> getThemes() async {
    dynamic rawThemes = await apiRepository.fetchThemes();
    return themeTransformer.fromListJson(rawThemes);
  }

  @override
  Future<List<CodolingoChapter>> getChapters(int themeId) async {
    dynamic rawChapters = await apiRepository.fetchChapters(themeId: themeId);
    return chapterTransformer.fromListJson(rawChapters);
  }

  @override
  Future<List<CodolingoModule>> getModules(int chapterId) async {
    dynamic rawModules = await apiRepository.fetchModules(chapterId: chapterId);
    return moduleTransformer.fromListJson(rawModules);
  }

  @override
  Future<List<CodolingoLesson>> getLessons(int moduleId) async {
    dynamic rawLessons = await apiRepository.fetchLessons(moduleId: moduleId);
    print(rawLessons);
    return lessonTransformer.fromListJson(rawLessons);
  }

  @override
  Future<List<CodolingoExercise>> startLesson(int lessonId) async {
    dynamic rawExercises = await apiRepository.startLesson(lessonId: lessonId);
    print(rawExercises);
    return exerciseTransformer.fromListJson(rawExercises);
  }

  @override
  Future<EndLessonResult> endLesson(int lessonId) async {
    dynamic rawEndLessons = await apiRepository.endLesson(lessonId: lessonId);
    print(rawEndLessons);
    return endLessonResultTransformer.fromJson(rawEndLessons);
  }

  @override
  Future<CodolingoAnswerResult> answerQuestion(
      CodolingoExerciseTypeEnum exercice, int questionId, dynamic answer) async {
    dynamic rawAnswer = await apiRepository.answerQuestion(exercice: exercice, questionId: questionId, answer: answer);
    return CodolingoAnswerResultTransformer().fromJson(exercice, rawAnswer);
  }

  @override
  Future<List<CodolingoExercise>> getFirstExercises() async {
    List<CodolingoTheme> themes = await getThemes();
    List<CodolingoChapter> chapters = await getChapters(themes.first.id);
    List<CodolingoModule> modules = await getModules(chapters.first.id);
    List<CodolingoLesson> lessons = await getLessons(modules.first.id);
    return startLesson(lessons.first.id);
  }

  @override
  Future<bool> login(String username, String password) async {
    bool response = await apiRepository.login(username: username, password: password);
    return response;
  }

}
