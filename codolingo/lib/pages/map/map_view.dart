import 'package:codolingo/components/atoms/buttons/lesson_button.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/components/molecules/map_divider/map_divider.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/pages/map/map_view_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  static const String route = "/map";

  @override
  State<MapPage> createState() => _MapPageState();
}

// Should use WidgetEventObserver instead of StatefulWidget
class _MapPageState extends WidgetEventObserver<MapPage> {
  late final MapViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MapViewModel("Private value", "Public value");
    viewModel.subscribe(this);
    viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('codolingo', style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Center(child: ExampleMap()),
    );
  }

  Widget ExampleMap() {
    return ListView(
      reverse: true,
      children: [
        const VerticalCodolingoSpacing(height: CodolingoSpacing.XXXLargeSpacing),
        for (var pattern in viewModel.mapPattern)
          switch (pattern) {
            SinglePattern(button: var buttonInfo) => SinglePatternWidget(buttonInfo),
            RowPattern(buttons: var buttonsInfo) => RowPatternWidget(buttonsInfo),
            DividerPattern() => const MapDivider(stars: 5),
          }
      ],
    );
  }

  Widget SinglePatternWidget(ButtonInfo button) {
    return Column(
      children: [
        const VerticalCodolingoSpacing(height: CodolingoSpacing.XXLargeSpacing),
        CodolingoLessonButton(
          buttonColor: button.color,
          onPressed: () {
            viewModel.goToLesson(button.moduleId, button.lessonId);
          },
          disabled: button.disabled,
        ),
      ],
    );
  }

  Widget RowPatternWidget(List<ButtonInfo> buttons) {
    return Column(
      children: [
        const VerticalCodolingoSpacing(height: CodolingoSpacing.XXLargeSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: CodolingoSpacing.XXXLargeSpacing.size,
          children: [
            for (var button in buttons)
              CodolingoLessonButton(
                buttonColor: button.color,
                onPressed: () {
                  viewModel.goToLesson(button.moduleId, button.lessonId);
                },
              ),
          ],
        ),
      ],
    );
  }
}

class ButtonInfo {
  final int moduleId;
  final int lessonId;
  final Color color = CodolingoColors.getRandomColor();
  final bool disabled;

  ButtonInfo(this.moduleId, this.lessonId, this.disabled);
}
