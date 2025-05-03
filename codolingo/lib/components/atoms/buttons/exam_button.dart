import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:flutter/material.dart';

class CodolingoExamButton extends StatefulWidget {
  final void Function()? onPressed;
  final Color buttonColor;
  final Color iconColor;
  final double size;
  final bool selected;

  const CodolingoExamButton({
    Key? key,
    required this.onPressed,
    this.buttonColor = CodolingoColors.Blue500,
    this.iconColor = CodolingoColors.Gold500,
    this.size = 100.0,
    this.selected = false,
  }) : super(key: key);

  @override
  State<CodolingoExamButton> createState() => _CodolingoLessonButtonState();
}

class _CodolingoLessonButtonState extends State<CodolingoExamButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (event) {
        setState(() {
          hover = true;
        });
      },
      onTapUp: (event) {
        setState(() {
          hover = false;
        });
      },
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: getColor(),
          shape: BoxShape.circle,
          boxShadow: widget.selected
              ? null
              : [
                  BoxShadow(
                    color: CodolingoColors.Blue100,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Center(
          child: Icon(
            Icons.star,
            color: widget.iconColor,
            size: widget.size * 0.6,
          ),
        ),
      ),
    );
  }

  Color getColor() {
    if (widget.selected) {
      return hover ? CodolingoColors.Blue500 : CodolingoColors.Blue300;
    } else {
      return hover ? CodolingoColors.Blue700 : widget.buttonColor;
    }
  }
}
