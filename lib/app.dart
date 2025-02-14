import 'package:finance_tracker_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/analytics_screen.dart';
import 'presentation/screens/saving_screen.dart';
import 'presentation/screens/transaction_history_screen.dart';
import 'statemanagement/cubit/navigation_cubit.dart';

class App extends StatelessWidget {
  App({super.key});

  final List<Widget> _screens = [
    HomeScreen(),
    AnalyticsScreen(),
    SavingScreen(),
    TransactionHistoryScreen(),
  ];
  final List<String> _screennames = ["Overview", "Analytics", "Savings", "Transactions"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavigationCubit, int>(
          builder: (context, currentIndex) {
            return Text(_screennames[currentIndex]);
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
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
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Analytics'),
                BottomNavigationBarItem(icon: Icon(Icons.savings), label: 'Saving'),
                BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Transactions'),
              ],
            );
          },
        ),
      ),
    );
  }
}
