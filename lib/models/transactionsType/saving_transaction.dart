import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';
import 'package:flutter/material.dart';

class SavingTransaction extends TransactionType {
  @override
  String transactionTypeName = "Saving";

  @override
  List<CategoryModel> categories = [
    CategoryModel(
      name: "Saving",
      color: Colors.purple.shade700,
      icon: Icons.favorite,
    ),
  ];
}
