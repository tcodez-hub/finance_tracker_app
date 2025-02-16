import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/moneyflow_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'money_flow_state.dart';

class MoneyFlowCubit extends Cubit<MoneyFlowState> {
  final MoneyFlowModel moneyFlowModel;

  MoneyFlowCubit(this.moneyFlowModel) : super(MoneyFlowInitial());

  void updateMoney(List<Transaction> transactions) {
    for (var transaction in transactions) {
      if (transaction.type == "Income") {
        moneyFlowModel.income += transaction.amount;
      }
      if (transaction.type == "Expense") {
        moneyFlowModel.expense += transaction.amount;
      }
      if (transaction.type == "Saving") {
        moneyFlowModel.saving += transaction.amount;
      }
    }
    moneyFlowModel.calculateTotalBalance();
    emit(MoneyFlowUpdated(moneyFlowModel));
  }
}
