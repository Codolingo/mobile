import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CodolingoStars extends StatelessWidget{

  const CodolingoStars({super.key, required this.starsNumber, this.color = CodolingoColors.Yellow500});

  final Color color;
  final int starsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        SvgPicture.asset(
          Assets.static.icons.star,
          height: 30,
          width: 30
        ),
        Text(
          starsNumber.toString(),
          style: Theme.of(context).textTheme.displaySmall?.copyWith(color: color),
        )
      ],
    );

  }
}