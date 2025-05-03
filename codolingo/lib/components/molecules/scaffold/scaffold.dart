import 'dart:ui';

import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/molecules/scaffold/scaffold_controller.dart';
import 'package:codolingo/components/molecules/scaffold/scaffold_view_model.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:flutter/material.dart';

class CodolingoScaffold extends StatefulWidget {
  final Widget body;
  final CodolingoScaffoldController? controller;

  const CodolingoScaffold({
    super.key,
    required this.body,
    this.controller,
  });

  @override
  State<CodolingoScaffold> createState() => _CodolingoScaffoldState();
}

class _CodolingoScaffoldState extends WidgetEventObserver<CodolingoScaffold> {
  late CodolingoScaffoldViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CodolingoScaffoldViewModel(widget.controller);
    _viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CodolingoColors.Primary,
      body: Stack(children: [
        SafeArea(child: widget.body),
        GestureDetector(
            onTapDown: (details) {
              _viewModel.scaffoldPressed();
            },
            onTapUp: (details) => _viewModel.scaffoldReleased(),
            onTapCancel: () => _viewModel.scaffoldReleased(),
            child: AnimatedOpacity(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 400),
              opacity: _viewModel.showBadAnswer && !_viewModel.scaffoldPress ? 1 : 0,
              child: IgnorePointer(
                ignoring: !_viewModel.showBadAnswer,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            )),
        SafeArea(child: _buildBlurredScreen())
      ]),
    );
  }

  Widget _buildBlurredScreen() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _viewModel.showBadAnswer ? 1 : 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _viewModel.scaffoldPress ? 0 : 1,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: _buildBadAnswerSheet(),
        ),
      ),
    );
  }

  Widget _buildBadAnswerSheet() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const VerticalCodolingoSpacing(height: CodolingoSpacing.XLargeSpacing),
        IgnorePointer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.touch_app,
                color: CodolingoColors.White,
                size: 22,
                shadows: [getPressedTextShadow()],
              ),
              const HorizontalColdolingoSpacing(width: CodolingoSpacing.SmallSpacing),
              Flexible(
                child: Text(
                  "Appuyez longuement pour revoir vos erreurs",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: CodolingoColors.White, shadows: [getPressedTextShadow()]),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: IgnorePointer(
            ignoring: !_viewModel.showBadAnswer,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _viewModel.explanationText,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
        IgnorePointer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 120,
                      maxWidth: 180,
                    ),
                    child: AspectRatio(
                      aspectRatio: 180 / 120,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.topCenter,
                        image: Assets.static.images.racoon.racoonSad.provider(),
                      ))),
                    ),
                  ),
                ),
              ),
              Container(child: Assets.static.images.shapes.discussTriangle.image(width: 90)),
              const HorizontalColdolingoSpacing(width: CodolingoSpacing.XXLargeSpacing),
            ],
          ),
        ),
        _buildBottomSheet()
      ],
    );
  }

  Widget _buildBottomSheet() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            ),
            padding: const EdgeInsets.all(24),
            child: AnimatedSize(
              curve: Curves.easeOutBack,
              duration: const Duration(milliseconds: 400),
              child: _viewModel.showBadAnswer
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.error,
                              color: CodolingoColors.Red500,
                              size: 32,
                            ),
                            const HorizontalColdolingoSpacing(width: CodolingoSpacing.LargeSpacing),
                            Expanded(
                              child: Text("Mauvaise nouvelle",
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: CodolingoColors.Red500,
                                        fontWeight: FontWeight.w700,
                                      )),
                            )
                          ],
                        ),
                        const VerticalCodolingoSpacing(height: CodolingoSpacing.LargeSpacing),
                        Text(_viewModel.aboveWrongText,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                        Text(_viewModel.belowWrongText,
                            style: const TextStyle(
                              color: CodolingoColors.Blue300,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            )),
                        const VerticalCodolingoSpacing(height: CodolingoSpacing.LargeSpacing),
                        CodolingoTextButton(
                          type: ButtonTypes.RedButton,
                          text: "J'ai compris",
                          onPressed: () {
                            _viewModel.closeBadAnswerSheet();
                          },
                        ),
                      ],
                    )
                  : Container(),
            ),
          ),
        ),
      ],
    );
  }

  Shadow getPressedTextShadow() {
    return Shadow(
      color: CodolingoColors.White.withOpacity(0.5),
      offset: Offset(0, 0),
      blurRadius: 3,
    );
  }
}
