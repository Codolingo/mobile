import 'package:codolingo/main.dart';
import 'package:codolingo/providers/live_provider.dart';
import 'package:flutter/material.dart';

void main() {
  CodolingoLiveProvider("https://codolingo.alexisl.fr");
  runApp(const MyApp());
}
