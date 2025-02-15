import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Transaction extends HiveObject {
  int id;
  double amount;
  String type;
  String category;
  String subcategory;
  String datetime;
  String notes;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.subcategory,
    required this.datetime,
    required this.notes,
  });
}
