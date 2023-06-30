import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuelto/pages/main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'fuel',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'To',
              style: TextStyle(
                color: Color.fromRGBO(1, 170, 142, 1),
                fontSize: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
