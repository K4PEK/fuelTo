import 'package:hive/hive.dart';

import '../models/expense.dart';

class HiveDatabase {
  final _myBox = Hive.box('expenses_db');

  //load notes
  List<Expense> loadExpenses() {
    List<Expense> savedExpensesFormatted = [];

    if (_myBox.get('ALL_EXPENSES') != null) {
      List<dynamic> savedExpenses = _myBox.get('ALL_EXPENSES');
      for (int i = 0; i < savedExpenses.length; i++) {
        Expense individualExpense = Expense(
          id: savedExpenses[i][0],
          title: savedExpenses[i][1],
          cost: savedExpenses[i][2],
          date: savedExpenses[i][3],
          tag: savedExpenses[i][4],
          count: savedExpenses[i][5],
          place: savedExpenses[i][6],
          city: savedExpenses[i][7],
          mileage: savedExpenses[i][8],
        );
        savedExpensesFormatted.add(individualExpense);
      }
    }
    return savedExpensesFormatted;
  }

  void savedExpenses(List<Expense> allExpenses) {
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpenses) {
      int id = expense.id;
      String title = expense.title;
      double cost = expense.cost;
      DateTime date = expense.date;
      String tag = expense.tag;
      int count = expense.count;
      String place = expense.place;
      String city = expense.city;
      int mileage = expense.mileage;

      allExpensesFormatted
          .add([id, title, cost, date, tag, count, place, city, mileage]);
    }
    _myBox.put('ALL_EXPENSES', allExpensesFormatted);
  }

  bool loadDarkMode() {
    bool? savedDarkMode;
    if (_myBox.get('DARKMODE_STATUS') != null) {
      savedDarkMode = _myBox.get('DARKMODE_STATUS');
    } else {
      savedDarkMode = false;
    }
    return savedDarkMode!;
  }

  void saveDarkMode(bool val) {
    _myBox.put('DARKMODE_STATUS', val);
  }
}
