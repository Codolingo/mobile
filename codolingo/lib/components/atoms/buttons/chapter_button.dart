import 'package:codolingo/components/atoms/buttons/button.dart';
import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:flutter/material.dart';


class CodolingoChapterButton extends StatelessWidget {
  const CodolingoChapterButton({super.key, required this.title, required this.subtitle, required this.onPressed, this.type = ButtonTypes.FullBlueButton, this.selected = false, required this.widget});

  final String title;
  final String subtitle;
  final void Function()? onPressed;
  final ButtonTypes type;
  final bool selected;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return CodolingoButton(
      selected: selected,
      onPressed: onPressed,
      type: type,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: selected
                      ? type.type.textColorPressed
                      : type.type.textColor,
                  fontSize: 24,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? type.type.textColorPressed
                      : type.type.textColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(width: 24),
          widget, 
        ],
      ),
    );
  }
}