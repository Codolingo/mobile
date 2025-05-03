import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/code_bloc/code_bloc.dart';

import 'package:flutter/material.dart';

class CodolingoRacoonText extends StatefulWidget {
  const CodolingoRacoonText({required this.assetImage, required this.text, this.code});

  final String text;
  final String? code;
  final ImageProvider assetImage;

  @override
  State<CodolingoRacoonText> createState() => _CodolingoRacoonTextState();
}

class _CodolingoRacoonTextState extends State<CodolingoRacoonText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ValueKey<String> _key;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _key = ValueKey<String>(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CodolingoRacoonText oldWidget) {
    if (oldWidget.assetImage != widget.assetImage) {
      _controller.forward();
    }
    
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100, minHeight: 75),
          child: ScaleTransition(
            scale: TweenSequence([
              TweenSequenceItem<double>(
                tween: Tween<double>(begin: 0.9, end: 1.1),
                weight: 2,
              ),
              TweenSequenceItem<double>(
                tween: Tween<double>(begin: 1.1, end: 1),
                weight: 1,
              ),
            ]).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            )),
            child: Image(
              key: ValueKey<String>(widget.text),
              image: widget.assetImage,
              fit: BoxFit.contain,
            ),
          ),
        )),
        const SizedBox(height: 8),
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CodolingoColors.Black,
            fontSize: 24,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.code != null) ...[
                  const SizedBox(height: 8),
                  CodolingoBlocCode(code: widget.code!),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
