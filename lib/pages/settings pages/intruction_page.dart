import 'package:flutter/material.dart';

class IntructionPage extends StatefulWidget {
  const IntructionPage({Key? key}) : super(key: key);

  @override
  State<IntructionPage> createState() => _IntructionPageState();
}

class _IntructionPageState extends State<IntructionPage> {
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
                'Jak używać aplikacji',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Opis aplikacji',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Korzystając z aplikacji FuelTo możesz zamieszczać swoje wydatki dotyczące auta, a także sprawdzić krótkie ich analizy na wykresach.',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Dodawanie wydatku',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                style: TextStyle(
                  color: Colors.grey[400],
                ),
                'Aby dodać nowy wydatek przejdź do drugiej zakładki oznaczonej "plusem", i uzupełnij dane, nie musisz uzupełniać wszystkich miejsc jednak zostaw przynajmniej w nich "0" lub "-" tak jak jest to podane automatycznie. Nie możesz potem edytować wydatku,',
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Usuwanie wydatku',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Aby usunąć wydatek, w pierwszej zakładce przesuń w lewo na wybranym przez ciebie wydatku',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Sortowanie wydatków',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'W pierwszej zakładce wyświetlając wydatki, możesz je filtrować używająć filtrów kategorii,',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Wyświetlanie wydatków',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Aby wyświetlić cały wydatek, w pierwszej zakładce kliknij na ikonę na szarym tle znajdującą się po lewej stronie wydatku',
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
            ],
          )),
    );
  }
}
