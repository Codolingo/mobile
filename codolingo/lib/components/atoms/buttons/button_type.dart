import 'dart:ui';

import 'package:codolingo/components/atoms/colors/colors.dart';

class ButtonType {
  final Color fillColor;
  final Color fillColorPressed;
  final Color fillColorHoverSelected;
  final Color fillColorHoverUnSelected;
  final Color strokeColor;
  final Color shadowColor;
  final Color textColor;
  final Color textColorPressed;

  const ButtonType({required this.fillColor, required this.fillColorPressed, required this.fillColorHoverSelected, required this.fillColorHoverUnSelected, required this.strokeColor, required this.shadowColor, required this.textColor, required this.textColorPressed});
}

enum ButtonTypes {
  BlueButton(ButtonType(
    fillColor: CodolingoColors.Blue50,
    fillColorPressed: CodolingoColors.Blue300, 
    fillColorHoverSelected: CodolingoColors.Blue500,
    fillColorHoverUnSelected: CodolingoColors.Blue100,
    strokeColor: CodolingoColors.Blue300, 
    shadowColor: CodolingoColors.Blue100,
    textColor: CodolingoColors.Blue300,
    textColorPressed: CodolingoColors.White,
  )),
  GreenButton(ButtonType(
    fillColor: CodolingoColors.Green50, 
    fillColorPressed: CodolingoColors.Green700,
    fillColorHoverSelected: CodolingoColors.Green700,
    fillColorHoverUnSelected: CodolingoColors.Green300,
    strokeColor: CodolingoColors.Green700, 
    shadowColor: CodolingoColors.Green700,
    textColor: CodolingoColors.Green700,
    textColorPressed: CodolingoColors.White
  )),
  RedButton(ButtonType(
    fillColor: CodolingoColors.Red50, 
    fillColorPressed: CodolingoColors.Red500,
    fillColorHoverSelected: CodolingoColors.Red500,
    fillColorHoverUnSelected: CodolingoColors.Red300,
    strokeColor: CodolingoColors.Red500, 
    shadowColor: CodolingoColors.Red500,
    textColor: CodolingoColors.Red500,
    textColorPressed: CodolingoColors.White
  )),
  FullBlueButton(ButtonType(
    fillColor: CodolingoColors.Blue300,
    fillColorPressed: CodolingoColors.Blue700, 
    fillColorHoverSelected: CodolingoColors.Blue100,
    fillColorHoverUnSelected: CodolingoColors.Blue500,
    strokeColor: CodolingoColors.Blue300, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White,
  )),
  FullGreenButton(ButtonType(
    fillColor: CodolingoColors.Green500, 
    fillColorPressed: CodolingoColors.Green700,
    fillColorHoverSelected: CodolingoColors.Green700,
    fillColorHoverUnSelected: CodolingoColors.Green300,
    strokeColor: CodolingoColors.Green500, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White
  )),
  FullRedButton(ButtonType(
    fillColor: CodolingoColors.Red500, 
    fillColorPressed: CodolingoColors.Red700,
    fillColorHoverSelected: CodolingoColors.Red700,
    fillColorHoverUnSelected: CodolingoColors.Red300,
    strokeColor: CodolingoColors.Red500, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White
  )),
  FullOrangeButton(ButtonType(
    fillColor: CodolingoColors.Orange500, 
    fillColorPressed: CodolingoColors.Orange700,
    fillColorHoverSelected: CodolingoColors.Orange700,
    fillColorHoverUnSelected: CodolingoColors.Orange500,
    strokeColor: CodolingoColors.Orange500, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White
  )),
  FullPinkButton(ButtonType(
    fillColor: CodolingoColors.Pink500, 
    fillColorPressed: CodolingoColors.Pink700,
    fillColorHoverSelected: CodolingoColors.Pink700,
    fillColorHoverUnSelected: CodolingoColors.Pink300,
    strokeColor: CodolingoColors.Pink500, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White
  )),
  FullGoldButton(ButtonType(
    fillColor: CodolingoColors.Gold500, 
    fillColorPressed: CodolingoColors.Gold700,
    fillColorHoverSelected: CodolingoColors.Gold700,
    fillColorHoverUnSelected: CodolingoColors.Gold300,
    strokeColor: CodolingoColors.Gold500, 
    shadowColor: CodolingoColors.White,
    textColor: CodolingoColors.White,
    textColorPressed: CodolingoColors.White
  ));

  const ButtonTypes(this.type);

  final ButtonType type;
}
