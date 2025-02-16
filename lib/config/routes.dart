import 'package:flutter/material.dart';
import 'package:finance_tracker_app/presentation/screens/main_screen.dart';
import 'package:finance_tracker_app/presentation/screens/settings_screen.dart';
import 'package:finance_tracker_app/presentation/screens/transaction_screen.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';

class AppRoute {
  static const String main = "main";
  static const String settings = "settings";
  static const String transaction = "transaction";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case main:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());

      case transaction:
        final transaction = routeSetting.arguments as Transaction?;
        return MaterialPageRoute(
          builder: (_) => TransactionScreen(transaction: transaction),
        );

      default:
        return MaterialPageRoute(builder: (_) => MainScreen());
    }
  }
}
