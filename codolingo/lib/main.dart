import 'package:codolingo/components/atoms/theme/theme.dart';
import 'package:codolingo/pages/lesson/lesson_view.dart';
import 'package:codolingo/pages/welcome/welcome_view.dart';
import 'package:codolingo/pages/map/map_view.dart';
import 'package:codolingo/pages/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:codolingo/pages/home/home_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Template', theme: CodolingoThemeData, home: const LoginPage(), routes: {
      LessonPageRoute.route: (context) => const LessonPageRoute(),
      WelcomePage.route: (context) => const WelcomePage(),
      HomePage.route: (context) => const HomePage(),
      MapPage.route: (context) => const MapPage(),
    });
  }
}
