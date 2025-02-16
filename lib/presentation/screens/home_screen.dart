import 'package:finance_tracker_app/presentation/widgets/calender_segment_button.dart';
import 'package:finance_tracker_app/presentation/widgets/money_overview_card.dart';
import 'package:finance_tracker_app/statemanagement/cubit/money_flow_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.secondaryContainer,
                  Theme.of(context).colorScheme.primary,
                ],
                focal: Alignment.topCenter,
                radius: 1,
              ),
            ),
            child: BlocBuilder<MoneyFlowCubit, MoneyFlowState>(
              builder: (context, state) {
                String balance = '0';
                String income = '0';
                String expense = '0';
                String saving = '0';
                if (state is MoneyFlowUpdated) {
                  balance = state.model.balance.toString();
                  income = state.model.income.toString();
                  expense = state.model.expense.toString();
                  saving = state.model.saving.toString();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    Text(
                      "Total Balance",
                      style: TextTheme.of(context).labelSmall,
                    ),
                    Text(balance, style: TextTheme.of(context).labelLarge),
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
                          icon: Icon(
                            Icons.trending_up_rounded,
                            color: Theme.of(context).colorScheme.surface,
                            size: 16,
                          ),
                          iconColor: Colors.green.shade500,
                          body: income,
                        ),
                        MoneyOverviewCard(
                          title: 'Expense',
                          icon: Icon(
                            Icons.trending_down_rounded,
                            color: Theme.of(context).colorScheme.surface,
                            size: 16,
                          ),
                          iconColor: Colors.red.shade500,
                          body: expense,
                        ),
                        MoneyOverviewCard(
                          title: 'Saving',
                          icon: Icon(
                            Icons.favorite_outlined,
                            color: Theme.of(context).colorScheme.surface,
                            size: 16,
                          ),
                          iconColor: Colors.pink.shade400,
                          body: saving,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
