import 'dart:io';

import 'package:finance_tracker_app/config/routes.dart';
import 'package:finance_tracker_app/hive/hive_registrar.g.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/presentation/screens/main_screen.dart';
import 'package:finance_tracker_app/statemanagement/cubit/navigation_cubit.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive
    ..init(Directory.current.path)
    ..registerAdapters();

  final transactionBox = await Hive.openBox<Transaction>('transactions');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(
          create: (_) => TransactionCubit(transactionBox),
        ), // Add TransactionCubit here
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routes: AppRoute.getRoutes(),
      initialRoute: AppRoute.main,
      home: MainScreen(),
    );
  }
}
