import 'package:flutter/material.dart';
import 'package:fuelto/components/expenses_tile.dart';
import 'package:fuelto/models/expenses_data.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../models/list_filters.dart';


class CostsPage extends StatefulWidget {
  const CostsPage({super.key});

  @override
  State<CostsPage> createState() => _CostsPageState();
}

class _CostsPageState extends State<CostsPage> {
  double? price;
  ListFilters? selectedFilter;

  double calculateTotalExpense(List<Expense> expenses) {
    return expenses.fold(0, (sum, expense) => sum + expense.cost);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesData>(
      builder: (context, value, child) {
        List<Expense> filteredExpenses =
            value.getFilteredExpenses(selectedFilter);
        double totalExpense = calculateTotalExpense(filteredExpenses);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Wydano łącznie',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pln',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          totalExpense.toStringAsFixed(2).split('.')[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(1, 170, 142, 1),
                            fontSize: 42,
                          ),
                        ),
                        Text(
                          '.${totalExpense.toStringAsFixed(2).split('.')[1]}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(1, 170, 142, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Wydatki',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                value.getFilteredExpenses(selectedFilter).isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Text(
                            'Dodaj coś nowego...',
                            style: TextStyle(
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount:
                              value.getFilteredExpenses(selectedFilter).length,
                          itemBuilder: (context, index) {
                            final item = value
                                .getFilteredExpenses(selectedFilter)[index];
                            return Dismissible(
                              direction: DismissDirection.endToStart,
                              key: Key(item.id.toString()),
                              background: Container(
                                color: Colors.red[200],
                                child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Usuń',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ]),
                              ),
                              onDismissed: (direction) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                value.deleteExpense(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Usunięto ${item.title}'),
                                    action: SnackBarAction(
                                      label: 'cofnij',
                                      onPressed: () {
                                        setState(() {
                                          value.allExpenses.insert(index, item);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: ExpensesTile(
                                expense: item,
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
