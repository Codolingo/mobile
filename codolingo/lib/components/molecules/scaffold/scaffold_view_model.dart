import 'package:codolingo/components/molecules/scaffold/scaffold_controller.dart';
import 'package:codolingo/model/mvvm/view_model.dart';

mixin CodolingoScaffoldViewModelMixin {
  void showBadAnswerSheet(
      {required String explanationText, required String aboveWrongText, required String belowWrongText, Function? onClosed});
}

class CodolingoScaffoldViewModel extends EventViewModel implements CodolingoScaffoldViewModelMixin {
  final CodolingoScaffoldController? controller;

  bool showBadAnswer = false;
  bool scaffoldPress = false;

  String explanationText = "";
  String aboveWrongText = "";
  String belowWrongText = "";
  Function? onClosed;

  CodolingoScaffoldViewModel(this.controller) {
    controller?.init(this);
  }

  @override
  void showBadAnswerSheet(
      {required String explanationText,
      required String aboveWrongText,
      required String belowWrongText,
      Function? onClosed}) {
    this.explanationText = explanationText;
    this.aboveWrongText = aboveWrongText;
    this.belowWrongText = belowWrongText;
    this.onClosed = onClosed;
    showBadAnswer = true;
    notify();
  }

  void scaffoldPressed() {
    scaffoldPress = true;
    notify();
  }

  void scaffoldReleased() {
    scaffoldPress = false;
    notify();
  }

  void closeBadAnswerSheet() {
    showBadAnswer = false;
    notify();
    onClosed?.call();
  }
}
