import 'package:codolingo/components/atoms/buttons/cross_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/progress_bar/progress_bar.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/atoms/streak/streak.dart';
import 'package:codolingo/components/molecules/scaffold/scaffold.dart';
import 'package:codolingo/components/molecules/scaffold/scaffold_controller.dart';
import 'package:codolingo/components/organisms/lesson/lesson_result.dart';
import 'package:codolingo/model/class/exercise_type_enum.dart';
import 'package:codolingo/components/organisms/exercise/mcq_exercise/mcq_exercise_view.dart';
import 'package:codolingo/model/class/lesson_with_exercises.dart';
import 'package:codolingo/model/class/linking_exercise.dart';
import 'package:codolingo/components/organisms/exercise/linking_exercise/linking_exercise_view.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/pages/lesson/lesson_view_model.dart';

class LessonPageRoute extends StatelessWidget {
  const LessonPageRoute({super.key});

  static const String route = "/lesson";
  @override
  Widget build(BuildContext context) {
    return LessonPage(lesson: ModalRoute.of(context)!.settings.arguments as CodolingoLessonWithExercises);
  }
}

class LessonPage extends StatefulWidget {
  final CodolingoLessonWithExercises lesson;
  const LessonPage({super.key, required this.lesson});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

// Should use WidgetEventObserver instead of StatefulWidget
class _LessonPageState extends WidgetEventObserver<LessonPage> {
  late final LessonViewModel viewModel;
  final CodolingoScaffoldController _controller = CodolingoScaffoldController();

  @override
  void initState() {
    super.initState();
    viewModel = LessonViewModel(lesson: widget.lesson, scaffoldController: _controller);
    viewModel.subscribe(this);
  }

  void onClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CodolingoScaffold(
      controller: _controller,
      body: Center(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildPage()),
      ),
    );
  }

  Widget _buildPage() {
    if (viewModel.uiState.lessonResult != null) {
      return _buildLessonResult();
    } else {
      return _buildLessonPage();
    }
  }

  Widget _buildLessonPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(CodolingoSpacing.SmallSpacing.size),
          child: Row(
            children: [
              CodolingoCrossButton(onPressed: viewModel.onExitClicked, size: 40),
              Expanded(
                child: CodolingoProgressBar(
                    colorBar: CodolingoColors.Blue500, percentageProgression: viewModel.uiState.progress),
              ),
            ],
          ),
        ),
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, animation.value == 1 ? -0.5 : 0.5),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: (viewModel.uiState.streak != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CodolingoStreak(streakNumber: viewModel.uiState.streak!),
                    ],
                  )
                : const SizedBox(height: 30)),

        // organism Exercise
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(animation.value == 1 ? -1 : 1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: _buildExercise(),
          ),
        )
      ],
    );
  }

  Widget _buildExercise() {
    switch (viewModel.uiState.exercise.type) {
      case CodolingoExerciseTypeEnum.mcqExercise:
        return CodolingoMCQExerciseView(
          key: Key(viewModel.uiState.exercise.id.toString()),
          mcqExercise: viewModel.uiState.exercise as CodolingoMCQExercise,
          onMCQExerciseAnswer: viewModel.onMCQExerciseDone,
        );
      case CodolingoExerciseTypeEnum.linkingExercise:
        return CodolingoLinkingExerciseView(
            key: Key(viewModel.uiState.exercise.id.toString()),
            exercise: viewModel.uiState.exercise as CodolingoLinkingExercise,
            onLinkingExerciseAnswer: viewModel.onLinkingExerciseDone);
      default:
        return Container();
    }
  }

  Widget _buildLessonResult() {
    return LessonResult(
      stars: viewModel.uiState.lessonResult!.stars,
      perfectStreak: viewModel.uiState.lessonResult!.perfectStreak,
      onContinueClicked: viewModel.onLessonResultClicked,
    );
  }
}
