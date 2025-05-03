import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/pages/home/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

// Should use WidgetEventObserver instead of StatefulWidget
class _HomePageState extends WidgetEventObserver<HomePage> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('codolingo', style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to codolingo !', style: Theme.of(context).textTheme.bodyMedium),
            const VerticalCodolingoSpacing(height: CodolingoSpacing.MediumSpacing),
            CodolingoTextButton(text: "Map", onPressed: viewModel.redirectToMap),
          ],
        ),
      ),
    );
  }
}
