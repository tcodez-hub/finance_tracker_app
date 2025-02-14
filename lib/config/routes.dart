import 'package:finance_tracker_app/presentation/screens/main_screen.dart';
import 'package:finance_tracker_app/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String base = "";
  static const String main = "main";
  static const String settings = "settings";

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      base: (context) => MainScreen(),
      main: (context) => MainScreen(),
      settings: (context) => SettingsScreen(),
    };
  }
}
