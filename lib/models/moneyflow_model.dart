class MoneyFlowModel {
  double income = 0;
  double expense = 0;
  double saving = 0;
  double totalBalance = 0;

  void calculateTotalBalance() {
    totalBalance = income - expense - saving;
  }
}
