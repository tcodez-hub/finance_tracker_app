import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/moneyflow_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:meta/meta.dart';

part 'money_flow_state.dart';

class MoneyFlowCubit extends Cubit<MoneyFlowState> {
  final MoneyFlowModel moneyFlowModel;

  MoneyFlowCubit(this.moneyFlowModel) : super(MoneyFlowInitial());

  void updateMoneyByTransaction(List<Transaction> transaction) {}
  void updateMoneyByTimePeriod(DateTime start, DateTime end) {}
}
