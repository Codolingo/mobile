import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:flutter/material.dart';

class CodolingoProgressBar extends StatelessWidget {
  const CodolingoProgressBar({super.key, required this.colorBar, required this.percentageProgression});

  final Color colorBar;
  final double percentageProgression;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 25.0,
        decoration: BoxDecoration(
          color: CodolingoColors.Grey500,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedFractionallySizedBox(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 400),
              widthFactor: percentageProgression,
              child: Container(
                decoration: BoxDecoration(
                  color: colorBar,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            )),
      ),
    );
  }
}
