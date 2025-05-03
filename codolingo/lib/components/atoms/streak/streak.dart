import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CodolingoStreak extends StatelessWidget {
  const CodolingoStreak({super.key, required this.streakNumber, this.color = CodolingoColors.Red500});

  final Color color;
  final int streakNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        SvgPicture.asset(Assets.static.icons.streakFire, height: 30, width: 30),
        // Text
        Text(
          "x",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: color),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, animation.value == 1 ? -0.5 : 0.5),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Text(
            "${streakNumber.toString()}",
            key: ValueKey<int>(streakNumber),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: color),
          ),
        ),
        Text(
          " streak",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: color),
        ),
      ],
    );
  }
}
