import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/spacing/divider.dart';
import 'package:codolingo/components/atoms/stars/stars.dart';
import 'package:flutter/material.dart';

class MapDivider extends StatelessWidget {
  // Close button + Progress Bar + Streak
  const MapDivider( 
      {Key? key,
      required this.stars})
      : super(key: key);

  final int stars;

  @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: const CodolingoDivider()),
              Text("Plus que ",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: CodolingoColors.Grey500)
              ),
              CodolingoStars(starsNumber: stars, color: CodolingoColors.Yellow500),
              Expanded(child: const CodolingoDivider())
            ],
          ),
        );
  }
}
