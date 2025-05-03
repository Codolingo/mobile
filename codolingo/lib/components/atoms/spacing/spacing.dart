import 'package:flutter/material.dart';

enum CodolingoSpacing {
  XXSmallSpacing(2),
  XSmallSpacing(4),
  SmallSpacing(8),
  MediumSpacing(12),
  LargeSpacing(16),
  XLargeSpacing(24),
  XXLargeSpacing(32),
  XXXLargeSpacing(48);

  final double size;

  const CodolingoSpacing(this.size);
}

class HorizontalColdolingoSpacing extends StatelessWidget {

  final CodolingoSpacing width;

  const HorizontalColdolingoSpacing({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.size,
    );
  }
}

class VerticalCodolingoSpacing extends StatelessWidget {
  
    final CodolingoSpacing height;
  
    const VerticalCodolingoSpacing({Key? key, required this.height}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: height.size,
      );
    }
}
