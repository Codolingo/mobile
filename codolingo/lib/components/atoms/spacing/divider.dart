import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:flutter/material.dart';

class CodolingoDivider extends StatelessWidget {
  const CodolingoDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CodolingoColors.Grey500,
      ),
    );
  }
}