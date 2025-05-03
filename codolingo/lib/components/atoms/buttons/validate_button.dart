import 'package:codolingo/components/atoms/buttons/button.dart';
import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:flutter/material.dart';


class CodolingoGreenButton extends StatelessWidget {
  const CodolingoGreenButton({super.key, required this.text, required this.onPressed, this.type = ButtonTypes.GreenButton, this.selected = false});

  final String text;
  final void Function()? onPressed;
  final ButtonTypes type;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return CodolingoButton(
        selected: selected,
        onPressed: onPressed,
        type: type,
        child: Text(
        text,
        style: TextStyle(
          color: selected
            ? type.type.textColorPressed
            : type.type.textColor, 
          fontSize: 24
        ),
      ),
    );  
  }
}