import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/moneyflow_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/statemanagement/cubit/money_flow_cubit.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final Box<Transaction> transactionBox;
  final MoneyFlowCubit moneyFlowCubit;

  TransactionCubit(this.transactionBox, this.moneyFlowCubit)
    : super(TransactionInitial());

  /// 🔹 Load all transactions from Hive
  void loadTransactions() {
    final transactions = transactionBox.values.toList();

    // Sort transactions by date in descending order (latest first)
    transactions.sort((a, b) => b.date.compareTo(a.date));

    moneyFlowCubit.updateMoney(transactions);
    emit(TransactionLoaded(transactions));
  }

  /// 🔹 Add a new transaction
  Future<void> addTransaction(Transaction transaction) async {
    await transactionBox.put(transaction.id, transaction);
    loadTransactions(); // Refresh state
  }

  /// 🔹 Update an existing transaction
  Future<void> updateTransaction(Transaction transaction) async {
    if (transactionBox.containsKey(transaction.id)) {
      await transaction.save();
      loadTransactions();
    }
  }

  void loadFilterTransaction(DateTime start, DateTime end) {
    final transactionBox = Hive.box<Transaction>('transactions');

    final filteredTransactions =
        transactionBox.values.where((transaction) {
          // Convert string date to DateTime
          DateTime transactionDate = DateFormat(
            "yyyy-MM-dd",
          ).parse(transaction.date);

          // Include transactions that occur on the start and end date
          return transactionDate.isAtSameMomentAs(start) ||
              transactionDate.isAtSameMomentAs(end) ||
              (transactionDate.isAfter(start) && transactionDate.isBefore(end));
        }).toList();

    // Sort transactions by date in descending order (latest first)
    filteredTransactions.sort((a, b) => b.date.compareTo(a.date));
    moneyFlowCubit.updateMoney(filteredTransactions);
    emit(TransactionLoaded(filteredTransactions));
  }

  int getTransactionBoxLength() {
    return transactionBox.values.length;
  }

  Transaction? getTransactionById(int id) {
    return transactionBox.get(id);
  }

  /// 🔹 Delete a transaction
  Future<void> deleteTransaction(int id) async {
    await transactionBox.delete(id);
    loadTransactions();
  }

  /// 🔹 Clear all transactions
  Future<void> clearAll() async {
    await transactionBox.clear();
    emit(TransactionLoaded([]));
  }
}
