import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:flutter/material.dart';

class CodolingoLessonButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color buttonColor;
  final Color iconColor;
  final double size;
  final bool selected;
  final bool disabled;

  const CodolingoLessonButton({
    Key? key,
    required this.onPressed,
    this.buttonColor = CodolingoColors.Pink500,
    this.iconColor = CodolingoColors.White,
    this.size = 80.0,
    this.selected = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<CodolingoLessonButton> createState() => _CodolingoLessonButtonState();
}

class _CodolingoLessonButtonState extends State<CodolingoLessonButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (event) {
        setState(() {
          hover = true;
        });
      },
      onTapUp: (event) {
        setState(() {
          hover = false;
        });
      },
      onTapCancel: () {
        setState(() {
          hover = false;
        });
      },
      onTap: widget.disabled ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.disabled ? CodolingoColors.Grey700 : getColor(),
          shape: BoxShape.circle,
          boxShadow: widget.selected || widget.disabled
              ? null
              : [
                  BoxShadow(
                    color: widget.buttonColor,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Center(
          child: Icon(
            Icons.edit,
            color: widget.iconColor,
            size: widget.size * 0.4,
          ),
        ),
      ),
    );
  }

  Color getColor() {
    if (widget.selected) {
      return hover ? widget.buttonColor.withAlpha(50) : widget.buttonColor.withAlpha(50);
    } else {
      return hover ? widget.buttonColor.withAlpha(50) : widget.buttonColor;
    }
  }
}
