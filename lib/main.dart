import 'package:flutter/material.dart';
import 'package:fuelto/models/expenses_data.dart';
import 'package:fuelto/pages/welcome_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'controls/app_state_notifier.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('expenses_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateNotifier>(
          create: (context) => AppStateNotifier(),
        ),
        ChangeNotifierProvider<ExpensesData>(
          create: (context) => ExpensesData(),
        ),
      ],
      child: Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
          return MaterialApp(
            themeMode: appState.isDarkMode != null && appState.isDarkMode!
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: const WelcomePage(),
          );
        },
      ),
    );
  }
}
