import 'package:finance_tracker_app/models/category_model.dart';
import 'package:flutter/material.dart';

class IncomeCategoryModel {
  static List<CategoryModel> incomeSource = [
    CategoryModel(
      name: "Salary",
      color: Colors.blue.shade500,
      icon: Icons.payments_rounded,
      subcategories: List.empty(),
    ),
    CategoryModel(
      name: "Gifts",
      color: Colors.purpleAccent.shade700,
      icon: Icons.card_giftcard_rounded,
      subcategories: List.empty(),
    ),
    CategoryModel(
      name: "Other",
      color: Colors.blueGrey,
      icon: Icons.more_horiz_outlined,
      subcategories: List.empty(),
    ),
  ];
}
