import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Transaction>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}