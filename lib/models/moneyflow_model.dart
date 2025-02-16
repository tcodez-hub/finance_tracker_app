class MoneyFlowModel {
  double income = 0;
  double expense = 0;
  double saving = 0;
  double balance = 0;

  void calculateTotalBalance() {
    balance = income - expense - saving;
  }
}
