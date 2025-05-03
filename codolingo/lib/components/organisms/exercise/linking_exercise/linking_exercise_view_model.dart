import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';
import 'package:codolingo/model/class/answer_element.dart';
import 'package:codolingo/model/class/linking_exercise.dart';
import 'package:codolingo/model/mvvm/view_model.dart';
import 'package:codolingo/utils/list_utils.dart';
import 'package:get_it/get_it.dart';

class LinkingExerciseViewModel extends EventViewModel {
  final GetIt getIt = GetIt.instance;

  CodolingoLinkingExercise exercise;
  late CodolingoLinkingExerciseUiState uiState;
  final List<CodolingoAnswerElementColoredGroup> userAnswers = [];
  CodolingoAnswerElement? selectedAnswer;
  Future<List<List<int>>> Function(List<List<int>> answer) onLinkingExerciseAnswer;
  bool hasPressedValidated = false;

  static List<ButtonTypes> availableColors = [
    ButtonTypes.FullBlueButton,
    ButtonTypes.FullGoldButton,
    ButtonTypes.FullOrangeButton,
    ButtonTypes.FullPinkButton,
  ];

  LinkingExerciseViewModel(this.exercise, this.onLinkingExerciseAnswer) {
    refreshButtons();
  }

  void refreshButtons() {
    uiState = CodolingoLinkingExerciseUiState(
        buttons: exercise.proposals
            .map((e) => ButtonObject(
                text: e.content,
                selected: userAnswers.any((element) => element.contains(e)) || selectedAnswer == e,
                style: userAnswers.firstWhereOrNull((element) => element.contains(e))?.color ??
                    (selectedAnswer == e ? getAvailableColor() : ButtonTypes.BlueButton),
                id: e.id))
            .toList());
    if (userAnswers.length == exercise.proposals.length / 2) {
      uiState.validationAvailable = true;
    }
    if (userAnswers.isNotEmpty && userAnswers.every((element) => element.color == ButtonTypes.GreenButton)) {
      uiState.isAnswerCorrect = true;
    } else {
      if (userAnswers.any((element) => element.color == ButtonTypes.RedButton)) {
        uiState.isAnswerCorrect = false;
      }
    }
    notify();
  }

  ButtonTypes getAvailableColor() {
    for (var color in availableColors) {
      if (!userAnswers.any((element) => element.color == color)) {
        return color;
      }
    }
    return ButtonTypes.FullBlueButton;
  }

  CodolingoAnswerElement getAnswerById(int id) {
    return exercise.proposals.firstWhere((element) => element.id == id);
  }

  void selectAnswer(int answerId) {
    CodolingoAnswerElement answer = getAnswerById(answerId);
    if (userAnswers.any((element) => element.contains(answer))) {
      userAnswers.removeWhere((element) => element.contains(answer));
      refreshButtons();
      return;
    }

    if (selectedAnswer == null) {
      selectedAnswer = answer;
    } else {
      if (selectedAnswer == answer) {
        selectedAnswer = null;
      } else {
        userAnswers
            .add(CodolingoAnswerElementColoredGroup(elements: [selectedAnswer!, answer], color: getAvailableColor()));
        selectedAnswer = null;
      }
    }
    refreshButtons();
  }

  void validate() async {
    if (!hasPressedValidated) {
      hasPressedValidated = true;
      List<List<int>> result = await onLinkingExerciseAnswer(
          userAnswers.map((e) => e.elements.map((e) => e.id).toList()).toList());
      for (var element in userAnswers) {
        List<int>? answerFound = result.firstWhereOrNull(
            (resultAnswer) => resultAnswer.every((resultAnswerPart) => element.containsId(resultAnswerPart)));
        if (answerFound != null) {
          element.color = ButtonTypes.GreenButton;
        } else {
          element.color = ButtonTypes.RedButton;
        }
      }
      refreshButtons();
    }
  }
}

class CodolingoLinkingExerciseUiState {
  List<ButtonObject> buttons;
  bool validationAvailable = false;
  bool? isAnswerCorrect = null;
  CodolingoLinkingExerciseUiState({required this.buttons});
}

class CodolingoAnswerElementColoredGroup {
  List<CodolingoAnswerElement> elements;
  ButtonTypes color;
  CodolingoAnswerElementColoredGroup({required this.elements, required this.color});

  contains(CodolingoAnswerElement element) {
    return elements.contains(element);
  }

  containsId(int id) {
    return elements.any((element) => element.id == id);
  }
}
