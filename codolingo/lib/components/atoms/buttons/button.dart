import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:flutter/material.dart';


class CodolingoButton extends StatefulWidget {
  const CodolingoButton({super.key, required this.child, required this.onPressed, this.type = ButtonTypes.BlueButton, this.selected = false});

  final Widget child;
  final void Function()? onPressed;
  final ButtonTypes type;
  final bool selected;

  @override
  State<CodolingoButton> createState() => _CodolingoButtonState();
}

class _CodolingoButtonState extends State<CodolingoButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: hover ? 0.5 : 1,
      duration: Duration(milliseconds: 100),
      child: SizedBox(
        child: GestureDetector(
          onPanDown: (event) {
            setState(() {
              hover = true;
            });
          },
          onTapUp: (event) {
            setState(() {
              hover = false;
            });
            widget.onPressed?.call();
          },
          onTapCancel: () => setState(() {
            hover = false;
          }),
          child: AnimatedContainer(
            padding: EdgeInsets.all(14),
            duration: Duration(milliseconds: 200),
            child: widget.child,
            decoration: BoxDecoration(
              color: widget.selected ? widget.type.type.fillColorPressed : widget.type.type.fillColor,
              border: Border.all(
                color: widget.type.type.strokeColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: widget.selected ? null : [
                BoxShadow(
                  color: widget.type.type.shadowColor,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ], 
            ),
          ),
        ),
      ),
    );
  }
}