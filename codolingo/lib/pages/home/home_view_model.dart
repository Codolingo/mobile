import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/lesson_type_enum.dart';
import 'package:codolingo/model/class/lesson_with_exercises.dart';
import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/model/mvvm/view_events/push_route_event.dart';
import 'package:codolingo/model/mvvm/view_events/update_view_event.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/pages/lesson/lesson_view.dart';
import 'package:codolingo/pages/map/map_view.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

class HomeViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;
  late ApiService _apiService;
  List<CodolingoChapter> chapters = [];

  HomeViewModel({ApiService? apiService}) {
    _apiService = apiService ?? getIt.get<ApiService>();
    getChaptersList();
  }

  void redirectFirstExercise() async {
    // Change the value to new value (it's available in the view)
    List<CodolingoExercise> exercises = await _apiService.startLesson(1);
    notify(PushRouteEvent(LessonPageRoute.route,
        arguments: CodolingoLessonWithExercises(1, "test", 0, true, CodolingoLessonTypeEnum.assessment, exercises)));
  }

  void redirectToMap() async {
    notify(const PushRouteEvent(MapPage.route));
  }

  Future<void> getChaptersList() async {
    List<CodolingoTheme> themes = await _apiService.getThemes();
    chapters = await _apiService.getChapters(themes[0].id);
    notify(const UpdateViewEvent());
  }
}
