import 'package:codolingo/model/class/exercise_type_enum.dart';

abstract class ApiRepository {
  /// Fetch the themes available
  Future<dynamic> fetchThemes();

  /// Fetch the chapters from a [themeId]
  Future<dynamic> fetchChapters({required int themeId});

  /// Fetch the modules from a [chapterId]
  Future<dynamic> fetchModules({required int chapterId});

  /// Fetch the lessons from a [moduleId]
  Future<dynamic> fetchLessons({required int moduleId});

  /// Start a lesson with id [lessonId]
  ///
  /// This will return a list of 10 random exercises from the lesson
  Future<dynamic> startLesson({required int lessonId});

  /// End a lesson with id [lessonId]
  ///
  /// This will return nothing as it is only a post request
  Future<dynamic> endLesson({required int lessonId});

  /// Answer a question with id [questionId] and answer [answer]
  ///
  /// The server will return the answer and if we are correct
  Future<dynamic> answerQuestion({
    required CodolingoExerciseTypeEnum exercice,
    required int questionId,
    required dynamic answer,
  });



  /// Get token [token] with expiration [expiresIn] after authentication
  /// 
  /// The server will return token and an expiration
  Future<bool> login({required String username, required String password});
}
