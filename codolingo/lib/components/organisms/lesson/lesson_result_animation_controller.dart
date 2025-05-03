import 'package:flutter/widgets.dart';

class LessonResultAnimationController {
  late List<AnimationController> starAnimationControllers = [];

  late AnimationController streakFadeAnimationController;
  late AnimationController streakSlideAnimationController;

  TickerProvider vsync;

  /// Animation controller for the LessonResultWidget
  LessonResultAnimationController({
    required this.vsync,
  }) {

    /// Animations for the 3-star widget
    for (int i = 0; i < 3; i++) {
      starAnimationControllers.add(AnimationController(
        vsync: vsync,
        duration: Duration(milliseconds: 500),
      ));
    }

    /// Animations for the streak widget
    streakFadeAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 400),
    );

    streakSlideAnimationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 500),
    );

    startAnimation();
  }

  void startAnimation() async {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(milliseconds: 300));
      starAnimationControllers[i].forward();
    }

    await Future.delayed(Duration(milliseconds: 100));

    streakFadeAnimationController.forward();
    streakSlideAnimationController.forward();
  }
}
