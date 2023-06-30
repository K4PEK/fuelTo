import 'package:flutter/material.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nowe / niedokończone funkcje',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Nie dostępne funkcje:',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '\n1. Importu danych\n2. Exportu danych\n3. Usunięcia wszystkich danych',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Nie w pełni działające funkcje:',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                '\n1. Ciemny motyw',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          )),
    );
  }
}
