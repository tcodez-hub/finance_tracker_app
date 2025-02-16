import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'transaction_page_state.dart';

class TransactionPageCubit extends Cubit<TransactionPageState> {
  Transaction transaction;

  CategoryModel currentCategory;

  TransactionPageCubit(this.transaction, this.currentCategory)
    : super(TransactionPageInitial());

  void updateTransactionPage() {
    emit(TransactionPageUpdate());
  }
}
