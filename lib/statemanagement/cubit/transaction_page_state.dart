part of 'transaction_page_cubit.dart';

@immutable
sealed class TransactionPageState {}

final class TransactionPageInitial extends TransactionPageState {}

class TransactionPageUpdate extends TransactionPageState {
  final Transaction transaction;

  TransactionPageUpdate({required this.transaction});
}
