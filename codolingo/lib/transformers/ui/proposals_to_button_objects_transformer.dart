import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/molecules/button_grid/button_object.dart';
import 'package:codolingo/model/class/answer_element.dart';

class ButtonObjectTransformer {
  ButtonObject fromProposal(CodolingoAnswerElement element, bool selected, ButtonTypes style) {
    return ButtonObject(text: element.content, selected: selected, style: style, id: element.id);
  }
}