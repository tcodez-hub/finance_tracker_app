import 'package:finance_tracker_app/models/category_model.dart';
import 'package:finance_tracker_app/models/transactionsType/transactions_type.dart';

class SavingTransaction extends TransactionType {
  @override
  String transactionTypeName = "Saving";

  @override
  List<CategoryModel> categories = [];
}
