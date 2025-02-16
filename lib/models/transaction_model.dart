import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class Transaction extends HiveObject {
  int id;
  double amount;
  String type;
  String category;
  String date;
  String time;
  String notes;

  Transaction({
    required this.id,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.time,
    required this.notes,
  });
  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, type: $type, category: $category, date: $date, time: $time, notes: $notes)';
  }
}
