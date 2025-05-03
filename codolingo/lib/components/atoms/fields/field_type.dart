import 'dart:ui';

import 'package:codolingo/components/atoms/colors/colors.dart';

class FieldType {
  final Color fillColor;
  final Color fillColorPressed;
  final Color strokeColor;
  final Color shadowColor;
  final Color hintTextColor;
  final Color textColorTaped;
  final Color cursorColor;

  const FieldType({required this.fillColor, required this.fillColorPressed, required this.strokeColor, required this.shadowColor, required this.hintTextColor, required this.textColorTaped, required this.cursorColor});
}

enum FieldTypes {
  ClassicField(FieldType(
    fillColor: CodolingoColors.White, 
    fillColorPressed: CodolingoColors.White,
    strokeColor: CodolingoColors.White, 
    shadowColor: CodolingoColors.White,
    hintTextColor: CodolingoColors.Grey700,
    textColorTaped: CodolingoColors.Black,
    cursorColor: CodolingoColors.Black,
  ));

  const FieldTypes(this.type);

  final FieldType type;
}
