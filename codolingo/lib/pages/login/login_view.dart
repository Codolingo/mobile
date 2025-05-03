import 'package:codolingo/components/atoms/buttons/validate_button.dart';
import 'package:codolingo/components/atoms/fields/field_type.dart';
import 'package:codolingo/components/atoms/fields/login_field.dart';
import 'package:codolingo/components/atoms/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/model/mvvm/widget_event_observer.dart';
import 'package:codolingo/pages/login/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Should use WidgetEventObserver instead of StatefulWidget
class _LoginPageState extends WidgetEventObserver<LoginPage> {
  late final LoginViewModel viewModel;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = LoginViewModel("Private value", "Public value");
    viewModel.subscribe(this);
  }

  void _attemptLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    viewModel.login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('codolingo', style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Connexion', style: Theme.of(context).textTheme.displayMedium),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CodolingoLoginField(hintText: "Identifiant", controller: _usernameController),
                    const VerticalCodolingoSpacing(height: CodolingoSpacing.MediumSpacing),
                    CodolingoLoginField(hintText: "Mot de passe", controller: _passwordController, type: FieldTypes.ClassicField, hidden: true,),
                    const VerticalCodolingoSpacing(height: CodolingoSpacing.MediumSpacing),
                    CodolingoGreenButton(text: "Se connecter", onPressed: _attemptLogin),
                    const VerticalCodolingoSpacing(height: CodolingoSpacing.XLargeSpacing),
                  ]
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
