import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:codolingo/model/class/linking_exercise.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/components/organisms/exercise/linking_exercise/linking_exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/components/molecules/button_grid/button_grid.dart';
import 'package:codolingo/components/molecules/racoon_text.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';

class CodolingoLinkingExerciseView extends StatefulWidget {
  final CodolingoLinkingExercise exercise;
  final Future<List<List<int>>> Function(List<List<int>> answer) onLinkingExerciseAnswer;
  const CodolingoLinkingExerciseView({super.key, required this.exercise, required this.onLinkingExerciseAnswer});
  static const String route = "/linking_exercise";

  @override
  State<CodolingoLinkingExerciseView> createState() => _CodolingoLinkingExerciseViewState();
}

class _CodolingoLinkingExerciseViewState extends WidgetEventObserver<CodolingoLinkingExerciseView> {
  late final LinkingExerciseViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LinkingExerciseViewModel(widget.exercise, widget.onLinkingExerciseAnswer);
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CodolingoSpacing.SmallSpacing.size),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: _buildRacoonText(context),
          ),
          _buildButtonGrid(context),
          SizedBox(height:CodolingoSpacing.XXLargeSpacing.size),
          _buildValidateButton(context),
          SizedBox(height:CodolingoSpacing.LargeSpacing.size)
        ],
      ),
    );
  }

  Widget _buildValidateButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CodolingoTextButton(text: "Je valide", onPressed: () {
            viewModel.validate();
          }, type: ButtonTypes.GreenButton, selected: false, disabled: !viewModel.uiState.validationAvailable ),
        ),
      ],
    );
  }

  Widget _buildRacoonText(BuildContext context) {
    return CodolingoRacoonText(
      assetImage: switch (viewModel.uiState.isAnswerCorrect) {
        true =>  Assets.static.images.racoon.racoonHappy.provider(),
        false => Assets.static.images.racoon.racoonSad.provider(),
        null => Assets.static.images.racoon.racoonNormal.provider(),
      },
      text: widget.exercise.label,
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    return ButtonGrid(
      nb_column: 2,
      list_buttons: buildListButtons(),
      onPressed: (id) {
        viewModel.selectAnswer(id);
      },
    );
  }

  List<ButtonObject> buildListButtons() {
    return viewModel.uiState.buttons;
  }
}
