import 'package:finance_tracker_app/presentation/widgets/calender_segment_button.dart';
import 'package:finance_tracker_app/presentation/widgets/money_overview_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16,),
          CaldendarSegmentButton(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
              gradient: RadialGradient(
                colors: [Theme.of(context).colorScheme.secondaryContainer, Theme.of(context).colorScheme.primary],
                focal: Alignment.topCenter,
                radius: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Text("Total Balance", style: TextTheme.of(context).labelSmall),
                Text("\$99004.00", style: TextTheme.of(context).labelLarge),
                // LinearProgressIndicator(
                //   value: 0.75,
                //   color: Theme.of(context).colorScheme.secondary,
                //   backgroundColor: Theme.of(context).colorScheme.onSecondary,
                //   minHeight: 12,
                //   borderRadius: BorderRadius.circular(8),
                // ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text("75%",style: TextTheme.of(context).labelSmall,),
                // ),
                SizedBox(height: 16),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MoneyOverviewCard(
                      title: 'Income',
                      icon: Icon(Icons.trending_up_rounded, color: Theme.of(context).colorScheme.surface, size: 16),
                      iconColor: Colors.green.shade500,
                      body: "\$50000",
                    ),
                    MoneyOverviewCard(
                      title: 'Expense',
                      icon: Icon(Icons.trending_down_rounded, color: Theme.of(context).colorScheme.surface, size: 16),
                      iconColor: Colors.red.shade500,
                      body: "\$50000",
                    ),
                    MoneyOverviewCard(
                      title: 'Saving',
                      icon: Icon(Icons.favorite_outlined, color: Theme.of(context).colorScheme.surface, size: 16),
                      iconColor: Colors.pink.shade400,
                      body: "\$50000",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Align(alignment: Alignment.centerLeft, child: Text("Recent Transaction", style: TextTheme.of(context).titleMedium)),
          ),
          Container(
            height: 400,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(28)),
            child: Center(child: Text("No Transaction to show :(", style: TextTheme.of(context).bodyLarge)),
          ),
        ],
      ),
    );
  }
}
