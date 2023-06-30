import 'package:flutter/material.dart';

import '../../components/my_switch.dart';

class DarkModePage extends StatefulWidget {
  const DarkModePage({Key? key}) : super(key: key);

  @override
  State<DarkModePage> createState() => _DarkModePageState();
}

class _DarkModePageState extends State<DarkModePage> {
  bool light = false;

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ciemny motyw',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            MySwitch(),
          ],
        ),
      ),
    );
  }
}
