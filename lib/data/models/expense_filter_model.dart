

import 'expenses_model.dart';

class ExpenseFilterModel {
  String type;
  num balance;
  List<ExpensesModel> allExpenses;

  ExpenseFilterModel({required this.type, required this.balance, required this.allExpenses});
}