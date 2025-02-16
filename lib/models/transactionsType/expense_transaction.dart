import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';
import 'package:flutter/material.dart';

class ExpenseTransaction extends TransactionType {
  @override
  String transactionTypeName = "Expense";

  @override
  List<CategoryModel> categories = [
    CategoryModel(
      name: "Food&Drinks",
      color: Colors.red.shade400,
      icon: Icons.fastfood_rounded,
      subcategories: ["Groceries", "Restaurant", "Other"],
    ),
    CategoryModel(
      name: "Shopping",
      color: Colors.pink.shade400,
      icon: Icons.shopping_bag_rounded,
      subcategories: [
        "Clothing",
        "Electronics",
        "Gifts",
        "Stationary",
        "Other",
      ],
    ),
    CategoryModel(
      name: "Housing",
      color: Colors.deepPurple.shade600,
      icon: Icons.house_rounded,
      subcategories: ["Rent", "Maintance", "Mortgage", "Utilities"],
    ),
  ];
}
