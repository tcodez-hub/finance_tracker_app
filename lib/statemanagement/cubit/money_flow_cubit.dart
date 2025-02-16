import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/moneyflow_model.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:finance_tracker_app/statemanagement/cubit/transaction_cubit.dart';
import 'package:meta/meta.dart';

part 'money_flow_state.dart';

class MoneyFlowCubit extends Cubit<MoneyFlowState> {
  final MoneyFlowModel moneyFlowModel;
  final TransactionCubit transactionCubit;

  MoneyFlowCubit(this.moneyFlowModel, this.transactionCubit)
    : super(MoneyFlowInitial());
}
