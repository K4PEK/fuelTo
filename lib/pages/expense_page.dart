import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class ExpensePage extends StatefulWidget {
  final Expense expense;
  const ExpensePage({
    super.key,
    required this.expense,
  });

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final df = DateFormat('dd-MM-yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(1, 170, 142, 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Wydatek z dnia: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    df.format(widget.expense.date).toString(),
                    style: const TextStyle(
                      color: Color.fromRGBO(1, 170, 142, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    String key;
                    String value;
                    IconData icon;

                    switch (index) {
                      case 0:
                        key = 'Nazwa';
                        value = widget.expense.title;
                        icon = Icons.flag;
                        break;
                      case 1:
                        key = 'Kategoria';
                        value = widget.expense.tag;
                        icon = Icons.category;
                        break;
                      case 2:
                        key = 'Cena';
                        value = widget.expense.cost.toString();
                        icon = Icons.price_change_outlined;
                        break;
                      case 3:
                        key = 'Ilość';
                        value = widget.expense.count.toString();
                        icon = Icons.onetwothree_outlined;
                        break;
                      case 4:
                        key = 'Miasto';
                        value = widget.expense.city;
                        icon = Icons.location_city_outlined;
                        break;
                      case 5:
                        key = 'Miejsce';
                        value = widget.expense.place;
                        icon = Icons.house;
                        break;
                      case 6:
                        key = 'Przebieg';
                        value = widget.expense.mileage.toString();
                        icon = Icons.speed_outlined;
                        break;
                      default:
                        key = '';
                        value = '';
                        icon = Icons.cancel_outlined;
                        break;
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$key: $value'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(icon),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          key,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          value.length > 8
                                              ? '${value.substring(0, 8)}...'
                                              : value,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'kliknij, jeśli zostało przycięte',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
