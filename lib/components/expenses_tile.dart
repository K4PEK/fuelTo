import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuelto/pages/expense_page.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class ExpensesTile extends StatefulWidget {
  final Expense expense;

  const ExpensesTile({
    super.key,
    required this.expense,
  });

  @override
  State<ExpensesTile> createState() => _ExpensesTileState();
}

class _ExpensesTileState extends State<ExpensesTile> {
  final df = DateFormat('dd-MM-yyyy');
  List<String> texts = [];
  Timer? timer;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    renderText();
    startTimer();
  }

  renderText() {
    texts = [
      df.format(widget.expense.date).toString(),
      'Kliknij ikonę, aby otworzyć',
      'Przesuń w lewo, aby usunąć',
    ];
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % texts.length;
        });
      }
    });
  }

  Map<String, IconData> tagIconMap = {
    'myjnia': Icons.wash_outlined,
    'tuning': Icons.switch_access_shortcut_add,
    'naprawa': Icons.settings,
    'tankowanie': Icons.oil_barrel_outlined,
    'ubezpieczenie': Icons.edit_document,
    'przeglad': Icons.search_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          ExpensePage(expense: widget.expense)),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    tagIconMap[widget.expense.tag],
                    color: const Color.fromRGBO(1, 170, 142, 1),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.expense.title.length > 16
                        ? '${widget.expense.title.substring(0, 16)}...'
                        : widget.expense.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    texts[currentIndex],
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '-${widget.expense.cost} pln',
            style: const TextStyle(
              color: Color.fromRGBO(1, 170, 142, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
