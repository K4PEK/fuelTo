import 'package:flutter/material.dart';

import '../controls/hive_database.dart';
import 'expense.dart';
import 'list_filters.dart';

class ExpensesData extends ChangeNotifier {
  final db = HiveDatabase();
  ExpensesData() {
    initializeExpenses();
  }

  List<Expense> allExpenses = [
    // id, title, tag, date, cost, count(o), place(o), city(o), mileage(o)
    // Expense(id: 0, title: 'Mycie auta', cost: 20, date: DateTime(2023,1,6), tag: 'myjnia',),
    // Expense(id: 1, title: 'Nowe radio', cost: 65.50, date: DateTime(2023,3,16), tag: 'tuning'),
    // Expense(id: 2, title: 'Wymiana alternatora', cost: 670, date: DateTime(2023,5,6), tag: 'naprawa')
  ];

  List<Expense> getFilteredExpenses(ListFilters? selectedFilter) {
    allExpenses.sort((a, b) => a.date.compareTo(b.date));
    if (selectedFilter == null) {
      return allExpenses.reversed.toList();
    } else {
      return allExpenses.reversed
          .where((expense) => expense.tag == selectedFilter.name.toString())
          .toList();
    }
  }

  void initializeExpenses() {
    allExpenses = db.loadExpenses();
  }

  List<Expense> getAllExpenses() {
    return allExpenses;
  }

  void addNewExpense(Expense expense) {
    allExpenses.add(expense);
    db.savedExpenses(allExpenses);
    notifyListeners();
  }

  void deleteExpense(Expense expense) {
    allExpenses.remove(expense);
    db.savedExpenses(allExpenses);
    notifyListeners();
  }
}
