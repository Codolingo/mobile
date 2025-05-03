import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/repositories/api/api_repository.dart';
import 'package:dio/dio.dart';

class LiveApiRepository extends ApiRepository {
  String? connectionToken;
  final String baseUrl;
  final Dio dio = Dio();

  LiveApiRepository(this.baseUrl);

  Options get authorizationOptions => Options(headers: {'Authorization': 'Bearer $connectionToken'});

  @override
  Future<dynamic> fetchChapters({required int themeId}) async {
    final request = await dio.get("$baseUrl${LiveApiRepositioryQueries.fetchChaptersByTheme}/$themeId",
        options: authorizationOptions);
    return request.data;
  }

  @override
  Future<dynamic> fetchLessons({required int moduleId}) async {
    final request = await dio.get("$baseUrl${LiveApiRepositioryQueries.fetchLessonsByModule}/$moduleId",
        options: authorizationOptions);
    return request.data;
  }

  @override
  Future<dynamic> fetchModules({required int chapterId}) async {
    final request = await dio.get("$baseUrl${LiveApiRepositioryQueries.fetchModulesByChapter}/$chapterId",
        options: authorizationOptions);
    return request.data;
  }

  @override
  Future<dynamic> fetchThemes() async {
    final request = await dio.get("$baseUrl${LiveApiRepositioryQueries.fetchThemes}", options: authorizationOptions);
    return request.data;
  }

  @override
  Future<dynamic> answerQuestion({
    required CodolingoExerciseTypeEnum exercice,
    required int questionId,
    required dynamic answer,
  }) async {
    final baseRequest = {
      "exerciseId": questionId,
      "exerciseType": exercice.apiValue,
    };
    if (exercice == CodolingoExerciseTypeEnum.mcqExercise) {
      baseRequest["answersIds"] = answer;
    } else {
      baseRequest["pairs"] = answer;
    }
    final request = await dio.post("$baseUrl${LiveApiRepositioryQueries.answerQuestion}",
        data: baseRequest,
        options: authorizationOptions);
    print(request.data);
    return request.data;
  }

  @override
  Future<dynamic> endLesson({required int lessonId}) async {
    final request =
        await dio.post("$baseUrl${LiveApiRepositioryQueries.endLesson}/$lessonId", options: authorizationOptions);
    return request.data;
  }

  @override
  Future<dynamic> startLesson({required int lessonId}) async {
    print("$baseUrl${LiveApiRepositioryQueries.startLesson}/$lessonId");
    final request =
        await dio.post("$baseUrl${LiveApiRepositioryQueries.startLesson}/$lessonId", options: authorizationOptions);
    print(request.data);
    return request.data["userExerciseDtos"].map((e) => e["exerciseDto"]).toList();
  }

  @override
  Future<bool> login({required String username, required String password}) async {
    final response = await dio.post(
      "$baseUrl${LiveApiRepositioryQueries.login}",
      data: {
        "username": username,
        "password": password,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      connectionToken = response.data['token'];
      return true;
    }
    return false;
  }
}

class LiveApiRepositioryQueries {
  static const String fetchThemes = "/api/themes";
  static const String fetchChaptersByTheme = "/api/chapters/theme";
  static const String fetchModulesByChapter = "/api/modules/chapter";
  static const String fetchLessonsByModule = "/api/lessons/module";
  static const String answerQuestion = "/api/exercises/answer";
  static const String startLesson = "/api/lessons/start";
  static const String endLesson = "/api/lessons/end";
  static const String login = "/auth/login";
}
