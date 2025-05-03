import 'package:codolingo/components/atoms/buttons/button_type.dart';

class ButtonObject {
  
  final String text;
  bool selected;
  ButtonTypes style;
  final int id;

  ButtonObject({required this.text, required this.selected, required this.style, required this.id});

}