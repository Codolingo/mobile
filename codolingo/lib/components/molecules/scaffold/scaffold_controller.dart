import 'package:codolingo/components/molecules/scaffold/scaffold_view_model.dart';

class CodolingoScaffoldController {
  CodolingoScaffoldViewModelMixin? viewModel;

  init(CodolingoScaffoldViewModelMixin viewModel) {
    this.viewModel = viewModel;
  }

  void showBadAnswerSheet(
      {required String explanationText, required String aboveWrongText, required String belowWrongText, Function? onClosed}) {
    viewModel?.showBadAnswerSheet(
        explanationText: explanationText, aboveWrongText: aboveWrongText, belowWrongText: belowWrongText, onClosed: onClosed);
  }
}
