import 'package:flutter/material.dart';
import 'package:fuelto/components/bar_graph.dart';
import 'package:fuelto/components/pie_graph.dart';
import 'package:fuelto/models/expense.dart';
import 'package:fuelto/models/expenses_data.dart';

import '../models/list_filters.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  double? price;
  ListFilters? selectedFilter;

  Map<int, double> monthlyExpenses = {};
  List<Expense>? expenses;

  void clearMonths() {
    monthlyExpenses = {
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
    };
  }

  void sumMonths() {
    clearMonths();
    ExpensesData expensesData = ExpensesData();
    expenses = expensesData.getFilteredExpenses(selectedFilter);
    if (expenses!.isEmpty) {
      return;
    }

    for (Expense expense in expenses!) {
      DateTime expenseDate = expense.date;
      int monthYearKey = expenseDate.month;
      monthlyExpenses[monthYearKey] =
          (monthlyExpenses[monthYearKey] ?? 0.0) + expense.cost;
    }
  }

  Map<String, double> tagsExpenses = {};
  List<Expense>? _expenses;

  void clearTags() {
    tagsExpenses = {
      'myjnia': 0,
      'tuning': 0,
      'naprawa': 0,
      'tankowanie': 0,
      'ubezpieczenie': 0,
      'przeglad': 0,
    };
  }

  void sumTags() {
    clearTags();
    ExpensesData expensesData = ExpensesData();
    _expenses = expensesData.getAllExpenses();
    if (_expenses!.isEmpty) {
      return;
    }
    for (Expense expense in _expenses!) {
      String tag = expense.tag;
      tagsExpenses[tag] = (tagsExpenses[tag] ?? 0) + expense.cost;
    }
  }

  Map<String, double> tagsExpenses2 = {};
  List<Expense>? _expenses2;

  void clearTags2() {
    tagsExpenses2 = {
      'myjnia': 0,
      'tuning': 0,
      'naprawa': 0,
      'tankowanie': 0,
      'ubezpieczenie': 0,
      'przeglad': 0,
    };
  }

  void sumTags2() {
    clearTags2();
    ExpensesData expensesData = ExpensesData();
    _expenses2 = expensesData.getAllExpenses();
    if (_expenses2!.isEmpty) {
      return;
    }
    for (Expense expense in _expenses2!) {
      String tag = expense.tag;
      tagsExpenses2[tag] = (tagsExpenses2[tag] ?? 0) + 1;
    }
  }

  Map<int, double> monthlyExpenses2 = {};
  List<Expense>? expenses2;

  void clearMonths2() {
    monthlyExpenses2 = {
      1: 0,
      2: 0,
      3: 0,
      4: 0,
      5: 0,
      6: 0,
      7: 0,
      8: 0,
      9: 0,
      10: 0,
      11: 0,
      12: 0,
    };
  }

  void sumMonths2() {
    clearMonths2();
    ExpensesData expensesData = ExpensesData();
    expenses2 = expensesData.getAllExpenses();
    if (expenses2!.isEmpty) {
      return;
    }

    for (Expense expense in expenses2!) {
      DateTime expenseDate = expense.date;
      int monthYearKey = expenseDate.month;
      monthlyExpenses2[monthYearKey] =
          (monthlyExpenses2[monthYearKey] ?? 0) + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    sumMonths();
    sumTags();
    sumTags2();
    sumMonths2();
  }

  @override
  Widget build(BuildContext context) {
    if (_expenses!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Wykresy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Brak danych do wyświetlenia',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      );
    } else {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Roczny wykres kwoty wydatków według miesiąca',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kliknij wybrany słupek, aby zobaczyć wartość',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 200,
                  child: MyBarGraph(
                    yearlySummary: monthlyExpenses,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 5,
                  children: ListFilters.values.map((ListFilters filter) {
                    return FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      selectedColor: const Color.fromRGBO(1, 170, 142, 1),
                      showCheckmark: false,
                      label: Text(
                        filter.name.toString(),
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      selected: selectedFilter == filter,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedFilter = filter;
                          } else {
                            selectedFilter = null;
                          }
                          sumMonths();
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Wykres sumy wydatków według kategorii',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cała historia',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                MyPieGraph(
                  sectors: tagsExpenses,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Roczny wykres ilości wydatków według miesiąca',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kliknij wybrany słupek, aby zobaczyć wartość',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 200,
                  child: MyBarGraph(
                    yearlySummary: monthlyExpenses2,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Wykres ilości wydatków według kategorii',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cała historia',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                MyPieGraph(
                  sectors: tagsExpenses2,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
