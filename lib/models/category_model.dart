import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final Color color;
  final IconData icon;
  final List<String> subcategories;

  CategoryModel({
    required this.name,
    required this.color,
    required this.icon,
    required this.subcategories,
  });
}
