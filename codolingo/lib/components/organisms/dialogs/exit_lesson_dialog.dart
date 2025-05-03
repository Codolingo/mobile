import 'dart:ui';

import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/atoms/theme/theme.dart';
import 'package:flutter/material.dart';

class ExitLessonDialog extends StatefulWidget {
  final void Function() onQuitPressed;
  final void Function() onContinuePressed;

  const ExitLessonDialog({super.key, required this.onQuitPressed, required this.onContinuePressed});

  @override
  State<ExitLessonDialog> createState() => _ExitLessonDialogState();
}

class _ExitLessonDialogState extends State<ExitLessonDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(CodolingoSpacing.LargeSpacing.size),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                child: Container(
                  padding: EdgeInsets.all(CodolingoSpacing.LargeSpacing.size),
                  decoration: BoxDecoration(color: CodolingoColors.Primary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Quitter la leçon ?", style: Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: CodolingoSpacing.MediumSpacing.size),
                      Text("Attention, vous allez perdre votre progression et ne pourrez pas reprendre à cet endroit plus tard.", style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(height: CodolingoSpacing.MediumSpacing.size),
                      Row(
                        children: [
                          Expanded(
                            child: CodolingoTextButton(
                              text: "Quitter",
                              onPressed: widget.onQuitPressed,
                              type: ButtonTypes.RedButton,
                            ),
                          ),
                          SizedBox(width: CodolingoSpacing.MediumSpacing.size),
                          Expanded(child: CodolingoTextButton(text: "Continuer", onPressed: widget.onContinuePressed)),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
