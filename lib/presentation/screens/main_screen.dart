import 'package:finance_tracker_app/config/routes.dart';
import 'package:finance_tracker_app/presentation/screens/home_screen.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'analytics_screen.dart';
import 'saving_screen.dart';
import 'transaction_history_screen.dart';
import '../../statemanagement/cubit/navigation_cubit.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    AnalyticsScreen(),
    SavingScreen(),
    TransactionHistoryScreen(),
  ];
  final List<String> _screennames = [
    "Overview",
    "Analytics",
    "Savings",
    "Transactions",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return Text(_screennames[currentIndex]);
          },
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.settings),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TransactionCubit>().loadTransactions();
          Navigator.pushNamed(context, AppRoute.transaction);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return IndexedStack(index: currentIndex, children: _screens);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        child: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              useLegacyColorScheme: false,
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<NavigationCubit>().changeTab(index);
                context.read<TransactionCubit>().loadTransactions();
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: 'Analytics',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.savings),
                  label: 'Saving',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: 'Transactions',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
