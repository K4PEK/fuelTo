import 'package:flutter/material.dart';
import 'package:fuelto/pages/add_page.dart';
import 'package:fuelto/pages/graphs.dart';
import 'package:fuelto/pages/expenses_page.dart';
import 'package:fuelto/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List _pages = const [
    CostsPage(),
    AddPage(),
    BusinessPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromRGBO(1, 170, 142, 1),
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Wydatki',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Dodaj nowy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_axis_sharp),
            label: 'Podsumowanie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ustawienia',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
