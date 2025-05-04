import 'dart:convert';

import 'package:codolingo/gen/assets.gen.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:flutter/services.dart';

class DummyApiService extends ApiService {
  static const correctAnswerId = 1;

  @override
  Future<dynamic> fetchChapters({required int themeId}) async {
    return jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.chapters));
  }

  @override
  Future<dynamic> fetchLessons({required int moduleId}) async {
    return jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.lessons));
  }

  @override
  Future<dynamic> fetchModules({required int chapterId}) async {
    return jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.modules));
  }

  @override
  Future<dynamic> fetchThemes() async {
    return jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.themes));
  }

  @override
  Future answerQuestion(
      {required CodolingoExerciseTypeEnum exercice, required int questionId, required dynamic answer}) {
    if (exercice == CodolingoExerciseTypeEnum.mcqExercise) {
      return Future.value(jsonDecode('{"answerElements": [{"id":$correctAnswerId}] }'));
    } else {
      return Future.value(jsonDecode(
          '{"answerElements": [[{"id":1}, {"id":2}], [{"id":3},{"id":4}], [{"id":5},{"id":6}], [{"id":7},{"id":8}]] }'));
    }
  }

  @override
  Future<dynamic> endLesson({required int lessonId}) {
    return Future.value(jsonDecode('{"nbStarsUnlocked": 3, "progression":100.0}'));
  }

  @override
  Future<dynamic> startLesson({required int lessonId}) async {
    return Future.value(jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.exercises)));
  }

  @override
  Future<bool> login({required String username, required String password}) async {
    //return jsonDecode(await rootBundle.loadString(Assets.static.dummy.api.login));
    // # Simulation d'une réponse d'authentification
    final String response = await rootBundle.loadString(Assets.static.dummy.api.login);
    if (username == 'utilisateur' && password == 'motdepasse') {
      return true;
    } else {
      return false;
    }
  }
}
