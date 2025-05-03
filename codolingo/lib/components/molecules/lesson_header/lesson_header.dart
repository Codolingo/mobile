import 'package:codolingo/components/atoms/buttons/cross_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/progress_bar/progress_bar.dart';
import 'package:codolingo/components/atoms/streak/streak.dart';
import 'package:flutter/material.dart';

class LessonHeader extends StatelessWidget {
  // Close button + Progress Bar + Streak
  const LessonHeader(
      {Key? key,
      required this.onClose,
      required this.progression,
      required this.streak})
      : super(key: key);

  final Function() onClose;
  final double progression;
  final int streak;

  void onPressed() {
    onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Close button
              CodolingoCrossButton(
                  onPressed: onPressed,
                  size: 40.0,
                  color: CodolingoColors.Grey500),
              // Progress Bar
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CodolingoProgressBar(
                      colorBar: CodolingoColors.Red500,
                      percentageProgression: progression),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Streak
            CodolingoStreak(streakNumber: streak, color: CodolingoColors.Red500)
          ],
        ),
      ],
    );
  }
}
