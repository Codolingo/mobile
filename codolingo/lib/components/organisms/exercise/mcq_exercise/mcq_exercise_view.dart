import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';
import 'package:codolingo/components/molecules/racoon_text.dart';
import 'package:codolingo/components/organisms/exercise/mcq_exercise/mcq_exercise_view_model.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/components/molecules/button_grid/button_grid.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';

import 'package:flutter/material.dart';

class CodolingoMCQExerciseView extends StatefulWidget {
  const CodolingoMCQExerciseView({super.key, required this.mcqExercise, required this.onMCQExerciseAnswer});

  final CodolingoMCQExercise mcqExercise;
  final Future<int> Function(int) onMCQExerciseAnswer;

  @override
  State<CodolingoMCQExerciseView> createState() => _CodolingoMCQExerciseViewState();
}

class _CodolingoMCQExerciseViewState extends WidgetEventObserver<CodolingoMCQExerciseView> {
  late CodolingoMCQExerciseViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CodolingoMCQExerciseViewModel(widget.mcqExercise, widget.onMCQExerciseAnswer);
    viewModel.subscribe(this);
  }

  @override
  void didUpdateWidget(covariant CodolingoMCQExerciseView oldWidget) {
    super.didUpdateWidget(oldWidget);
    viewModel.refreshExercise(widget.mcqExercise);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CodolingoSpacing.SmallSpacing.size),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: CodolingoRacoonText(
                  assetImage: switch (viewModel.uiState.isAnswerCorrect) {
                    true => Assets.static.images.racoon.racoonHappy.provider(),
                    false => Assets.static.images.racoon.racoonSad.provider(),
                    null => Assets.static.images.racoon.racoonNormal.provider(),
                  },
                  text: viewModel.uiState.question,
                  code: null)),
          ButtonGrid(
                  nb_column: 1, list_buttons: viewModel.uiState.buttons, onPressed: viewModel.onButtonClicked),
        ],
      ),
    );
  }
}
