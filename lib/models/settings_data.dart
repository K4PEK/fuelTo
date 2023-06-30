import 'package:flutter/material.dart';
import 'package:fuelto/controls/hive_database.dart';

class SettingsData extends ChangeNotifier {
  final db = HiveDatabase();

  SettingsData() {
    initializeSettings();
  }
  bool? darkMode;

  bool getDarkMode() {
    return darkMode!;
  }

  Future<void> initializeSettings() async {
    darkMode = db.loadDarkMode();
  }

  void saveSettings(bool val) {
    db.saveDarkMode(val);
  }
}
