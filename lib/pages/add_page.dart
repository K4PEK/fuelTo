// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fuelto/models/expenses_data.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateFormat df = DateFormat('dd-MM-yyyy HH:mm');

  List<String> categories = <String>[
    'myjnia',
    'tuning',
    'naprawa',
    'tankowanie',
    'ubezpieczenie',
    'przeglad'
  ];

  void _addNewExpense(BuildContext context) {
    try {
      int id = Provider.of<ExpensesData>(context, listen: false)
          .getAllExpenses()
          .length;

      DateTime date = df.parse(dateInput.text);
      String title = titleInput.text;
      double cost = double.parse(costInput.text);
      String tag = dropdownValue.toString();
      String city = cityInput.text;
      String place = placeInput.text;
      int count = int.parse(countInput.text);
      int mileage = int.parse(mileageInput.text);
      Provider.of<ExpensesData>(context, listen: false).addNewExpense(Expense(
        id: id,
        title: title,
        cost: cost,
        date: date,
        tag: tag,
        city: city,
        place: place,
        count: count,
        mileage: mileage,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Dodano nowy wydatek",
          ),
        ),
      );

      clearControllers();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Nie poprawne dane: ${e.toString().split(":")[1]}'),
        ),
      );
    }
  }

  void clearControllers() {
    dateInput.text = df.format(DateTime.now());
    dropdownValue = categories.first;
    costInput.text = '0.00';
    titleInput.text = '';
    cityInput.text = '-';
    placeInput.text = '-';
    countInput.text = '1';
    mileageInput.text = '0';
  }

  TextEditingController costInput = TextEditingController();
  TextEditingController titleInput = TextEditingController();
  TextEditingController categoryInput = TextEditingController();
  String? dropdownValue;
  TextEditingController dateInput = TextEditingController();
  TextEditingController cityInput = TextEditingController();
  TextEditingController placeInput = TextEditingController();
  TextEditingController countInput = TextEditingController();
  TextEditingController mileageInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = df.format(DateTime.now());
    dropdownValue = categories.first;
    costInput.text = '0.00';
    titleInput.text = '-';
    cityInput.text = '-';
    placeInput.text = '-';
    countInput.text = '1';
    mileageInput.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Dodaj nowy wydatek',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Kwota',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            TextField(
              controller: costInput,
              style: const TextStyle(
                fontSize: 40,
              ),
              cursorColor: const Color.fromRGBO(1, 170, 142, 1),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixText: 'pln',
                  hintText: 'np. 25.96',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixStyle: const TextStyle(
                    color: Color.fromRGBO(1, 170, 142, 1),
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Tytuł',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: titleInput,
                cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                style: const TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  hintText: 'np. nabłyszczanie',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: const Icon(Icons.abc_outlined),
                  suffixIconColor: const Color.fromRGBO(1, 170, 142, 1),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Kategoria',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownValue,
                    iconEnabledColor: const Color.fromRGBO(1, 170, 142, 1),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Ilość',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: TextField(
                controller: countInput,
                keyboardType: TextInputType.number,
                cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                style: const TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  hintText: 'np. 1',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: const Icon(Icons.onetwothree_outlined),
                  suffixIconColor: const Color.fromRGBO(1, 170, 142, 1),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Data i godzina',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: TextField(
                  readOnly: true,
                  controller: dateInput,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                  keyboardType: TextInputType.datetime,
                  cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.date_range_outlined),
                    suffixIconColor: Color.fromRGBO(1, 170, 142, 1),
                    border: InputBorder.none,
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        DateTime pickedDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        String formattedDateTime = df.format(pickedDateTime);
                        setState(() {
                          dateInput.text = formattedDateTime;
                        });
                      }
                    }
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Miasto',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: TextField(
                controller: cityInput,
                cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                style: const TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  hintText: 'np. Warszawa',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: const Icon(Icons.location_city_outlined),
                  suffixIconColor: const Color.fromRGBO(1, 170, 142, 1),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Sklep / stacja',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: TextField(
                controller: placeInput,
                cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                style: const TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  hintText: 'np. Stacja benzyna Volta',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: const Icon(Icons.house),
                  suffixIconColor: const Color.fromRGBO(1, 170, 142, 1),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Przebieg samochodu',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[300],
                border: Border.all(
                  color: const Color.fromRGBO(238, 238, 238, 1),
                ),
              ),
              child: TextField(
                controller: mileageInput,
                keyboardType: TextInputType.number,
                cursorColor: const Color.fromRGBO(1, 170, 142, 1),
                style: const TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  hintText: 'np. 356000',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                  suffixIcon: const Icon(Icons.speed_outlined),
                  suffixIconColor: const Color.fromRGBO(1, 170, 142, 1),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _addNewExpense(context);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color.fromRGBO(1, 170, 142, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(238, 238, 238, 1),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        'Zapisz',
                        style: TextStyle(color: Colors.black54),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
