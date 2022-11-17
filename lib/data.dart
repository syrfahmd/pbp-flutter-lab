class Budget {
  Budget({required this.name, required this.amount, required this.type});
  String name;
  double amount;
  String type;
}

class ListBudget {
  static List<Budget> budgets = [];
}