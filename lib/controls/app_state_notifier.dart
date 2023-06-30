import 'package:flutter/material.dart';
import 'package:fuelto/models/settings_data.dart';

class AppStateNotifier extends ChangeNotifier {
  bool? isDarkMode;

  AppStateNotifier() {
    loadSetting();
  }

  void loadSetting() async {
    SettingsData sData = SettingsData();
    await sData.initializeSettings();
    isDarkMode = sData.getDarkMode();
    notifyListeners();
  }

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
