import 'package:codolingo/components/atoms/buttons/button.dart';
import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:flutter/material.dart';

class CodolingoRedButton extends StatelessWidget {
  const CodolingoRedButton({super.key, required this.text, required this.onPressed, this.type = ButtonTypes.RedButton, this.selected = false});

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