// ignore_for_file: unused_import

import 'package:codolingo/components/molecules/scaffold/scaffold_controller.dart';
import 'package:codolingo/components/organisms/dialogs/exit_lesson_dialog.dart';
import 'package:codolingo/model/api/answer_result.dart';
import 'package:codolingo/model/api/end_lesson_result.dart';
import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/exercise.dart';
import 'package:codolingo/model/class/lesson.dart';
import 'package:codolingo/model/class/lesson_with_exercises.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:codolingo/model/mvvm/view_events/pop_route_event.dart';
import 'package:codolingo/model/mvvm/view_events/show_dialog_event.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/services/api/api_service.dart';
import 'package:codolingo/services/lesson_service.dart';
import 'package:codolingo/utils/list_utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';

class LessonViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;

  final CodolingoScaffoldController scaffoldController;

  late ApiService apiService;
  late LessonService lessonService;

  CodolingoLessonWithExercises lesson;
  List<CodolingoExercise> exercises = [];
  LessonViewModelUiState uiState;
  int currentExerciseIndex = 0;
  int correctAnswers = 0;
  int streakAnswers = 0;

  LessonViewModel(
      {required this.lesson, required this.scaffoldController, ApiService? apiService, LessonService? lessonService})
      : uiState = LessonViewModelUiState(exercise: lesson.exercises.first) {
    this.apiService = apiService ?? getIt<ApiService>();
    this.lessonService = lessonService ?? getIt<LessonService>();

    exercises = lesson.exercises;
  }

  void nextExercise(bool timeout) async {
    if (timeout) {
      await Future.delayed(const Duration(seconds: 1));
    }
    if (currentExerciseIndex < exercises.length - 1) {
      currentExerciseIndex++;
      uiState = LessonViewModelUiState(
          exercise: exercises[currentExerciseIndex], progress: currentExerciseIndex / exercises.length);
      updateStreak();
      notify();
    } else {
      EndLessonResult lessonResult = await apiService.endLesson(lesson.id);
      uiState.lessonResult =
          LessonViewModelResultUiState(stars: lessonResult.stars, perfectStreak: lessonResult.progress == 100.0);
      notify();
    }
  }

  void updateStreak() {
    if (streakAnswers >= 2) {
      uiState.streak = streakAnswers;
      notify();
    }
  }

  Future<int> onMCQExerciseDone(int p1) async {
    CodolingoAnswerResult result = await apiService.answerQuestion(uiState.exercise.type, uiState.exercise.id, [p1]);
    CodolingoMCQExercise currentExercise = exercises[currentExerciseIndex] as CodolingoMCQExercise;
    if (result.answer != p1) {
      String answerText =
          currentExercise.proposals.firstWhere((CodolingoAnswerElement answer) => answer.id == result.answer).content;
      scaffoldController.showBadAnswerSheet(
          explanationText: result.explanation,
          aboveWrongText: "La bonne réponse était :",
          belowWrongText: answerText,
          onClosed: () {
            nextExercise(false);
          });
      streakAnswers = 0;
    } else {
      correctAnswers++;
      streakAnswers++;
      nextExercise(true);
    }
    return result.answer;
  }

  Future<List<List<int>>> onLinkingExerciseDone(List<List<int>> answer) async {
    List<Map<String, int>> answerMap = answer.map((List<int> answer) {
      return {"leftId": answer[0], "rightId": answer[1]};
    }).toList();
    CodolingoLinkingAnswerResult result = await apiService.answerQuestion(
        uiState.exercise.type, uiState.exercise.id, answerMap) as CodolingoLinkingAnswerResult;
    if (!result.answer.every((List<int> resultAnswer) {
      return answer
              .firstWhereOrNull((element) => element.every((int elementData) => resultAnswer.contains(elementData))) !=
          null;
    })) {
      scaffoldController.showBadAnswerSheet(
          explanationText: result.explanation,
          aboveWrongText: "Mauvaise réponse",
          belowWrongText: "Essaye encore",
          onClosed: () {
            nextExercise(false);
          });
      streakAnswers = 0;
    } else {
      correctAnswers++;
      streakAnswers++;
      nextExercise(true);
    }
    return result.answer;
  }

  void onLessonResultClicked() {
    notify(PopRouteEvent());
  }

  void onExitClicked() {
    notify(ShowDialogEvent(ExitLessonDialog(onQuitPressed: () {
      notify(PopRouteEvent());
      notify(PopRouteEvent());
    }, onContinuePressed: () {
      notify(PopRouteEvent());
    })));
  }
}

class LessonViewModelUiState {
  double progress = 0;
  final CodolingoExercise exercise;
  LessonViewModelResultUiState? lessonResult;
  int? streak = null;

  LessonViewModelUiState({required this.exercise, this.progress = 0});
}

class LessonViewModelResultUiState {
  final int stars;
  final bool perfectStreak;
  LessonViewModelResultUiState({required this.stars, required this.perfectStreak});
}
