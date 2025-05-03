import 'package:codolingo/components/atoms/buttons/button_type.dart';
import 'package:codolingo/components/atoms/buttons/text_button.dart';
import 'package:codolingo/components/atoms/buttons/theme_button.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:codolingo/pages/welcome/welcome_view_model.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/gen/assets.gen.dart';
import 'package:codolingo/components/atoms/colors/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  static const String route = '/welcome';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

// Should use WidgetEventObserver instead of StatefulWidget
class _WelcomePageState extends WidgetEventObserver<WelcomePage> {
  late final WelcomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = WelcomeViewModel();
    viewModel.subscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Padding(
            padding: EdgeInsets.all(CodolingoSpacing.MediumSpacing.size),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(animation.value == 1 ? -0.5 : 0.5, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: viewModel.showThemes ? Container(key: const Key('theme_selection_container'), child: _buildThemeSelection()) : Container(key: const Key('welcome_screen_container'), child: _buildWelcomeScreen()),
            ))));
  }

  Widget _buildWelcomeScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 120,
                      maxWidth: 180,
                    ),
                    child: Image(
                      image: Assets.static.images.racoon.racoonNormal.provider(),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'Je vois que c\'est la première fois que tu viens.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Bienvenue !',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: CodolingoColors.Blue500,
                      ),
                ),
                const VerticalCodolingoSpacing(height: CodolingoSpacing.MediumSpacing),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16), // Optional padding for spacing
          child: Row(
            children: [
              Expanded(
                child: CodolingoTextButton(
                  text: "Oui ! ✨",
                  onPressed: viewModel.onWelcomeScreenClicked,
                  type: ButtonTypes.FullBlueButton,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThemeSelection() {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.themes.isEmpty) {
      return Center(
        child: Text(
          'Aucun thème disponible',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    } else {
      return Column(
        children: [
          const Text(
            'Choisis ton premier langage !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CodolingoColors.Black,
              fontSize: 26,
            ),
          ),
          const VerticalCodolingoSpacing(height: CodolingoSpacing.MediumSpacing),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemCount: viewModel.themes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CodolingoThemeButton(
                            text: viewModel.themes[index].label,
                            type: ButtonTypes.FullOrangeButton,
                            onPressed: viewModel.redirectChapterSelection,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }
  }
}
