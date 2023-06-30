import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
              'Usuń dane',
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
                Icons.delete_forever_outlined,
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
