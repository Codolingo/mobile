import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';
import 'package:codolingo/model/class/mcq_exercise.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/utils/list_utils.dart';

class CodolingoMCQExerciseViewModel extends EventViewModel {
  CodolingoMCQExercise exercise;
  late CodolingoMCQExerciseUiState uiState;
  final Future<int> Function(int) onMCQExerciseAnswer;

  CodolingoMCQExerciseViewModel(this.exercise, this.onMCQExerciseAnswer) {
    refreshExercise(exercise);
  }

  void refreshExercise(CodolingoMCQExercise exercise) {
    this.exercise = exercise;
    uiState = CodolingoMCQExerciseUiState(buttons: [], question: exercise.label);
    refreshButtons();
  }

  void refreshButtons() {
    uiState.buttons = exercise.proposals
        .map((e) => ButtonObject(text: e.content, selected: false, style: ButtonTypes.BlueButton, id: e.id))
        .toList();
    notify();
  }

  Future<void> onButtonClicked(int id) async {
    ButtonObject? buttonSelected = uiState.buttons.firstWhereOrNull((element) => element.id == id);
    bool buttonAlreadySelected = uiState.buttons.firstWhereOrNull((element) => element.selected) != null;
    if (buttonSelected != null && !buttonAlreadySelected) {
      buttonSelected.selected = true;
      int correctAnswer = await onMCQExerciseAnswer(buttonSelected.id);
      if (correctAnswer == buttonSelected.id) {
        buttonSelected.style = ButtonTypes.GreenButton;
        uiState.isAnswerCorrect = true;
      } else {
        buttonSelected.style = ButtonTypes.RedButton;
        ButtonObject? correctButton = uiState.buttons.firstWhereOrNull((element) => element.id == correctAnswer);
        if (correctButton != null) {
          correctButton.style = ButtonTypes.GreenButton;
        }
        uiState.isAnswerCorrect = false;
      }
    }
    notify();
  }
}

class CodolingoMCQExerciseUiState {
  String question;
  List<ButtonObject> buttons;
  bool? isAnswerCorrect = null;

  CodolingoMCQExerciseUiState({required this.question, required this.buttons});
}
