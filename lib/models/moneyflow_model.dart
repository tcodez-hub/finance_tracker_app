class MoneyFlowModel {
  double totalIncome = 0;
  double totalExpense = 0;
  double totalSaving = 0;
  double totalBalance = 0;

  double visualIncome = 0;
  double visualExpense = 0;
  double visualSaving = 0;
  double visualBalance = 0;

  void calculateTotalBalance() {
    totalBalance = totalIncome - totalExpense - totalSaving;
    visualBalance = visualIncome - visualExpense - visualSaving;
  }
}
