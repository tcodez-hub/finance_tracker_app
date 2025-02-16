import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/moneyflow_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final Box<Transaction> transactionBox;
  TransactionCubit(this.transactionBox) : super(TransactionInitial());

  /// 🔹 Load all transactions from Hive
  void loadTransactions() {
    final transactions = transactionBox.values.toList();
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
