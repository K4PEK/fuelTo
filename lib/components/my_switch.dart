import 'package:flutter/material.dart';
import 'package:fuelto/models/settings_data.dart';
import 'package:provider/provider.dart';
import '../../controls/app_state_notifier.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
          return Switch(
            activeColor: const Color.fromRGBO(1, 170, 142, 1),
            value: appState.isDarkMode!,
            onChanged: (bool value) {
              appState.updateTheme(value);
              SettingsData sData = SettingsData();
              sData.saveSettings(value);
            },
          );
        },
      ),
    );
  }
}
