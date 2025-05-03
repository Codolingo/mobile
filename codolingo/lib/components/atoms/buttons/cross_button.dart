import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CodolingoCrossButton extends StatefulWidget {
  const CodolingoCrossButton({super.key, required this.onPressed, this.size = 40.0, this.color = CodolingoColors.Grey500});

  final void Function()? onPressed;
  final double size;
  final Color color;

  @override
  State<CodolingoCrossButton> createState() => _CodolingoCrossButtonState();
}

class _CodolingoCrossButtonState extends State<CodolingoCrossButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    return AnimatedOpacity(
      opacity:  pressed ? 0.5 : 1, 
      duration: Duration(milliseconds: 100),
      child : SizedBox(
        child: GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (details) {
            _onTapDown();
          },
          onTapUp: (details) {
            _onTapUp();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: size,
            height: size, 
            child:SvgPicture.asset(
              Assets.static.icons.crossButton,
              height: 45,
              width:45,
            ),
          ),
        ),
      ),
    );
  }

  void _onTapDown() {
      setState(() {
        pressed = true;
      });
  }

  void _onTapUp() {
      setState(() {
        pressed = false;
      });
  }

  double getOpacity() {
    return widget.onPressed != null ? 1 : 0.5;
  }
}
