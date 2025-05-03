import 'package:codolingo/components/atoms/buttons/button.dart';
import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:flutter/material.dart';

class CodolingoTextButton extends StatelessWidget {
  const CodolingoTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.type = ButtonTypes.BlueButton,
      this.selected = false,
      this.disabled = false});

  final String text;
  final void Function()? onPressed;
  final ButtonTypes type;
  final bool selected;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: !disabled ? 1 : 0.5,
        child: CodolingoButton(
            selected: selected,
            onPressed: !disabled ? onPressed : null,
            type: type,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: selected ? type.type.textColorPressed : type.type.textColor, fontSize: 24),
            )));
  }
}
