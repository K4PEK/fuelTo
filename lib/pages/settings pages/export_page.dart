import 'package:flutter/material.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({Key? key}) : super(key: key);

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Eskportuj dane',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(
                Icons.save_alt_outlined,
                color: Color.fromRGBO(1, 170, 142, 1),
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
