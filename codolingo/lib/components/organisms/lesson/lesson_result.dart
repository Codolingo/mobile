import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/organisms/lesson/lesson_result_animation_controller.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonResult extends StatefulWidget {
  final int stars;
  final bool perfectStreak;
  final Function onContinueClicked;

  const LessonResult({
    super.key,
    required this.stars,
    required this.perfectStreak,
    required this.onContinueClicked,
  });

  @override
  State<LessonResult> createState() => _LessonResultState();
}

class _LessonResultState extends State<LessonResult> with TickerProviderStateMixin {
  late LessonResultAnimationController _animationController;

  @override
  void initState() {
    _animationController = LessonResultAnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Image(
                image: Assets.static.images.racoon.racoonHappy.provider(),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text("Leçon terminée !", style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => FadeTransition(
                  opacity: TweenSequence([
                    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
                  ]).animate(
                    CurvedAnimation(
                      parent: _animationController.starAnimationControllers[index],
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: SvgPicture.asset(
                    Assets.static.icons.star,
                    height: 45,
                    width: 45,
                    colorFilter: ColorFilter.mode(
                        widget.stars > index ? CodolingoColors.Gold500 : CodolingoColors.Grey500, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (widget.perfectStreak)
              FadeTransition(
                opacity: TweenSequence([
                  TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
                ]).animate(
                  CurvedAnimation(
                    parent: _animationController.streakFadeAnimationController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: SlideTransition(
                  position: TweenSequence<Offset>([
                    TweenSequenceItem(tween: Tween(begin: Offset(0, 1), end: Offset.zero), weight: 1),
                  ]).animate(
                    CurvedAnimation(
                      parent: _animationController.streakSlideAnimationController,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.static.icons.streakFire, height: 30, width: 30),
                      Text(
                        "Parfait !",
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(color: CodolingoColors.Red500),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        Positioned.fill(
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(CodolingoSpacing.SmallSpacing.size),
                      child: CodolingoTextButton(
                          text: "Continuer",
                          onPressed: () {
                            widget.onContinueClicked();
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: CodolingoSpacing.XXLargeSpacing.size)
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: ConfettiController(duration: const Duration(seconds: 1))..play(),
          colors: widget.perfectStreak ? [CodolingoColors.Red500] : [CodolingoColors.Gold500, CodolingoColors.Blue500],
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 20,
          createParticlePath: widget.perfectStreak ? buildFireConfetti : buildStarConfetti,
          minimumSize: const Size(20, 20),
          maximumSize: const Size(40, 40),
        ),
      ],
    );
  }

  Path buildStarConfetti(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.6, size.height * 0.94);
    path.cubicTo(size.width * 0.6, size.height * 0.94, size.width * 0.84, size.height * 1.09, size.width * 0.84,
        size.height * 1.09);
    path.cubicTo(size.width * 0.89, size.height * 1.12, size.width * 0.94, size.height * 1.08, size.width * 0.93,
        size.height * 1.02);
    path.cubicTo(size.width * 0.93, size.height * 1.02, size.width * 0.87, size.height * 0.74, size.width * 0.87,
        size.height * 0.74);
    path.cubicTo(size.width * 0.87, size.height * 0.74, size.width * 1.08, size.height * 0.54, size.width * 1.08,
        size.height * 0.54);
    path.cubicTo(size.width * 1.12, size.height * 0.51, size.width * 1.1, size.height * 0.44, size.width * 1.05,
        size.height * 0.43);
    path.cubicTo(size.width * 1.05, size.height * 0.43, size.width * 0.76, size.height * 0.41, size.width * 0.76,
        size.height * 0.41);
    path.cubicTo(size.width * 0.76, size.height * 0.41, size.width * 0.65, size.height * 0.14, size.width * 0.65,
        size.height * 0.14);
    path.cubicTo(size.width * 0.63, size.height * 0.09, size.width * 0.57, size.height * 0.09, size.width * 0.55,
        size.height * 0.14);
    path.cubicTo(size.width * 0.55, size.height * 0.14, size.width * 0.44, size.height * 0.41, size.width * 0.44,
        size.height * 0.41);
    path.cubicTo(size.width * 0.44, size.height * 0.41, size.width * 0.15, size.height * 0.43, size.width * 0.15,
        size.height * 0.43);
    path.cubicTo(size.width * 0.1, size.height * 0.44, size.width * 0.08, size.height * 0.51, size.width * 0.12,
        size.height * 0.54);
    path.cubicTo(
        size.width * 0.12, size.height * 0.54, size.width / 3, size.height * 0.74, size.width / 3, size.height * 0.74);
    path.cubicTo(size.width / 3, size.height * 0.74, size.width * 0.27, size.height * 1.02, size.width * 0.27,
        size.height * 1.02);
    path.cubicTo(size.width * 0.26, size.height * 1.08, size.width * 0.31, size.height * 1.12, size.width * 0.36,
        size.height * 1.09);
    path.cubicTo(size.width * 0.36, size.height * 1.09, size.width * 0.6, size.height * 0.94, size.width * 0.6,
        size.height * 0.94);
    path.cubicTo(size.width * 0.6, size.height * 0.94, size.width * 0.6, size.height * 0.94, size.width * 0.6,
        size.height * 0.94);
    return path;
  }

  Path buildFireConfetti(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.81, size.height * 1.07);
    path.cubicTo(
        size.width, size.height * 1.03, size.width * 1.23, size.height * 0.92, size.width * 1.23, size.height * 0.62);
    path.cubicTo(
        size.width * 1.23, size.height * 0.35, size.width, size.height * 0.17, size.width * 0.84, size.height * 0.08);
    path.cubicTo(size.width * 0.8, size.height * 0.06, size.width * 0.76, size.height * 0.09, size.width * 0.76,
        size.height * 0.13);
    path.cubicTo(size.width * 0.76, size.height * 0.13, size.width * 0.76, size.height * 0.22, size.width * 0.76,
        size.height * 0.22);
    path.cubicTo(size.width * 0.76, size.height * 0.29, size.width * 0.72, size.height * 0.43, size.width * 0.62,
        size.height * 0.49);
    path.cubicTo(size.width * 0.57, size.height * 0.51, size.width * 0.52, size.height * 0.47, size.width * 0.51,
        size.height * 0.42);
    path.cubicTo(size.width * 0.51, size.height * 0.42, size.width * 0.51, size.height * 0.38, size.width * 0.51,
        size.height * 0.38);
    path.cubicTo(
        size.width / 2, size.height / 3, size.width * 0.44, size.height * 0.3, size.width * 0.4, size.height / 3);
    path.cubicTo(size.width * 0.31, size.height * 0.38, size.width * 0.23, size.height * 0.48, size.width * 0.23,
        size.height * 0.62);
    path.cubicTo(
        size.width * 0.23, size.height, size.width * 0.54, size.height * 1.08, size.width * 0.69, size.height * 1.08);
    path.cubicTo(size.width * 0.7, size.height * 1.08, size.width * 0.71, size.height * 1.08, size.width * 0.72,
        size.height * 1.08);
    path.cubicTo(size.width * 0.65, size.height * 1.07, size.width * 0.52, size.height * 1.03, size.width * 0.52,
        size.height * 0.89);
    path.cubicTo(size.width * 0.52, size.height * 0.79, size.width * 0.61, size.height * 0.72, size.width * 0.68,
        size.height * 0.68);
    path.cubicTo(size.width * 0.69, size.height * 0.67, size.width * 0.72, size.height * 0.69, size.width * 0.72,
        size.height * 0.7);
    path.cubicTo(size.width * 0.72, size.height * 0.7, size.width * 0.72, size.height * 0.73, size.width * 0.72,
        size.height * 0.73);
    path.cubicTo(size.width * 0.72, size.height * 0.76, size.width * 0.73, size.height * 0.79, size.width * 0.75,
        size.height * 0.82);
    path.cubicTo(size.width * 0.78, size.height * 0.85, size.width * 0.82, size.height * 0.82, size.width * 0.82,
        size.height * 0.78);
    path.cubicTo(size.width * 0.82, size.height * 0.77, size.width * 0.84, size.height * 0.76, size.width * 0.85,
        size.height * 0.77);
    path.cubicTo(size.width * 0.88, size.height * 0.79, size.width * 0.93, size.height * 0.83, size.width * 0.93,
        size.height * 0.89);
    path.cubicTo(
        size.width * 0.93, size.height, size.width * 0.87, size.height * 1.05, size.width * 0.81, size.height * 1.07);
    path.cubicTo(size.width * 0.81, size.height * 1.07, size.width * 0.81, size.height * 1.07, size.width * 0.81,
        size.height * 1.07);
    return path;
  }
}
