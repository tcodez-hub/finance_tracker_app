part of 'money_flow_cubit.dart';

@immutable
sealed class MoneyFlowState {}

final class MoneyFlowInitial extends MoneyFlowState {}

class MoneyFlowUpdated extends MoneyFlowState {
  final MoneyFlowModel model;
  MoneyFlowUpdated(this.model);
}
