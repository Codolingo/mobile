abstract class CodolingoAnswerResult<T> {
  static const String answerField = "answerElements";
  static const String answerFieldId = "id";
  static const String explanationField = "explanation";

  final T answer;
  final String explanation;

  const CodolingoAnswerResult(this.answer, {this.explanation = ""});
}

class CodolingoMCQAnswerResult extends CodolingoAnswerResult<int> {
  const CodolingoMCQAnswerResult(super.answer, {super.explanation = ""});
}

class CodolingoLinkingAnswerResult extends CodolingoAnswerResult<List<List<int>>> {
  const CodolingoLinkingAnswerResult(super.answer, {super.explanation = ""});
}
