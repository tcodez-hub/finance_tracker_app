import 'package:finance_tracker_app/models/category_model.dart';

abstract class TransactionType {
  abstract String transactionTypeName;
  abstract List<CategoryModel> categories;
}
