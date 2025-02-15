import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'transaction_page_state.dart';

class TransactionPageCubit extends Cubit<TransactionPageState> {
  Transaction transaction;

  TransactionPageCubit(this.transaction) : super(TransactionPageInitial());

  void updateTransactionPage(Transaction transaction) {
    emit(TransactionPageUpdate(transaction: transaction));
  }
}
