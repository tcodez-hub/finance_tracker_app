import 'package:finance_tracker_app/config/routes.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/models/transactionsType/expense_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/income_transacrion.dart';
import 'package:finance_tracker_app/models/transactionsType/saving_transaction.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionType> type = [
      IncomeTransacrion(),
      ExpenseTransaction(),
      SavingTransaction(),
    ];
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is! TransactionLoaded) {
          return const Placeholder();
        }
        if (state.transactions.isEmpty) {
          return Center(child: Text("Wow, such Empty"));
        }
        return ListView.builder(
          itemCount: state.transactions.length,
          itemBuilder: (context, index) {
            Color iconColor = Colors.black;
            IconData iconData = Icons.abc;
            Color textColor = Colors.red;
            for (var t in type) {
              if (state.transactions[index].type == t.transactionTypeName) {
                for (var category in t.categories) {
                  if (state.transactions[index].category == category.name) {
                    iconColor = category.color;
                    iconData = category.icon;
                    if (state.transactions[index].type == "Income") {
                      textColor = Colors.green;
                    }
                    if (state.transactions[index].type == "Expense") {
                      textColor = Colors.red;
                    }
                    if (state.transactions[index].type == "Saving") {
                      textColor = Colors.purple;
                    }
                    break;
                  }
                }
              }
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.transaction,
                    arguments: state.transactions[index],
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadiusDirectional.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: iconColor,
                            foregroundColor: Colors.white,
                            child: Icon(iconData),
                          ),
                          SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                state.transactions[index].category,
                                style: TextTheme.of(context).bodyLarge,
                              ),
                              Text(
                                state.transactions[index].type,
                                style: TextTheme.of(context).bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            DateFormat("MMMM d, y").format(
                              DateTime.parse(state.transactions[index].date),
                            ),
                            style: TextTheme.of(context).bodyLarge,
                          ),
                          Text(
                            state.transactions[index].time,
                            style: TextTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        state.transactions[index].amount.toString(),
                        style: TextTheme.of(
                          context,
                        ).titleMedium?.copyWith(color: textColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
