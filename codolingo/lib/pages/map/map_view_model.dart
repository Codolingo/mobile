import 'dart:math';

import 'package:codolingo/model/class/chapter.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/lesson_type_enum.dart';
import 'package:codolingo/model/class/lesson_with_exercises.dart';
import 'package:codolingo/model/class/module.dart';
import 'package:codolingo/model/class/theme.dart';
import 'package:codolingo/model/mvvm/view_events/push_route_event.dart';
import 'package:codolingo/model/mvvm/view_events/update_view_event.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/pages/lesson/lesson_view.dart';
import 'package:codolingo/pages/map/map_view.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:get_it/get_it.dart';

class MapViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;

  late ApiService _apiService;

  // Value not accessible by the view
  // ignore: unused_field
  final String _privateValue;

  List<CodolingoTheme> themes = [];
  List<MapButtonType> mapPattern = [];

  // TODO : get selected theme + chapter in storage
  int currentTheme = 0;
  int currentChapter = 0;

  int buttonsCpt = 0;

  // Value accessible by the view
  String publicValue;

  MapViewModel(this._privateValue, this.publicValue, {ApiService? apiService}) {
    _apiService = apiService ?? getIt.get<ApiService>();
  }

  // Method to change the value and notify the view
  void doSomething() async {
    // implement
  }

  void fetchData() async {
    themes = await _apiService.getThemes();

    for (var theme in themes) {
      theme.chapters = await _apiService.getChapters(theme.id);

      for (var chapter in theme.chapters) {
        chapter.modules = await _apiService.getModules(chapter.id);

        for (var module in chapter.modules) {
          module.lessons = await _apiService.getLessons(module.id);
        }
      }
    }
    determineMap();
    notify();
  }

  void goToLesson(int moduleId, int lessonId) async {
    CodolingoLesson lesson = themes[currentTheme]
        .chapters[currentChapter]
        .modules
        .firstWhere((module) => module.id == moduleId)
        .lessons
        .firstWhere((lesson) => lesson.id == lessonId);
    List<CodolingoExercise> exercises = await _apiService.startLesson(lessonId);
    notify(PushRouteEvent(LessonPageRoute.route,
        arguments: CodolingoLessonWithExercises(
            lessonId, lesson.label, lesson.nbStars, lesson.isUnlocked, CodolingoLessonTypeEnum.assessment, exercises)));
  }

  void determineMap() {
    // For each modules and for each lessons in the modules, create a button
    // But create random combinations of buttons (RowOfButtons and SingleButton)
    // You have to keep the last lesson for each module as a SingleButton
    // You can use the ButtonInfo class to pass the module and lesson id
    // Create a button using enum
    CodolingoChapter chapter = themes[currentTheme].chapters[currentChapter];
    mapPattern = [];
    for (var module in chapter.modules) {
      int lessonIndex = 0;
      while (lessonIndex < module.lessons.length) {
        CodolingoLesson lesson = module.lessons[lessonIndex];
        if (lesson.id == module.lessons.last.id || lesson.id == module.lessons[module.lessons.length - 2].id) {
          mapPattern.add(SinglePattern(ButtonInfo(module.id, lesson.id, !lesson.isUnlocked)));
          lessonIndex++;
        } else {
          // Une chance sur trois random d'avoir un single button sinon row of buttons
          Random random = Random();
          if (random.nextInt(3) == 0) {
            mapPattern.add(SinglePattern(ButtonInfo(module.id, lesson.id, !lesson.isUnlocked)));
            lessonIndex++;
          } else {
            mapPattern.add(RowPattern(
                [ButtonInfo(module.id, lesson.id, !lesson.isUnlocked), ButtonInfo(module.id, module.lessons[lessonIndex + 1].id, !lesson.isUnlocked)]));
            lessonIndex += 2;
          }
        }
      }
      mapPattern.add(DividerPattern());
    }
  }
}

sealed class MapButtonType {}

class DividerPattern extends MapButtonType {
  DividerPattern();
}

class SinglePattern extends MapButtonType {
  final ButtonInfo button;

  SinglePattern(this.button);
}

class RowPattern extends MapButtonType {
  final List<ButtonInfo> buttons;

  RowPattern(this.buttons);
}
