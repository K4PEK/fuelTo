import 'package:flutter/material.dart';
import 'package:fuelto/components/settings_tile.dart';
import 'package:fuelto/pages/settings%20pages/darkmode_page.dart';
import 'package:fuelto/pages/settings%20pages/delete_page.dart';
import 'package:fuelto/pages/settings%20pages/export_page.dart';
import 'package:fuelto/pages/settings%20pages/features_page.dart';
import 'package:fuelto/pages/settings%20pages/import_page.dart';
import 'package:fuelto/pages/settings%20pages/intruction_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Ustawienia',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Ciemny motyw',
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DarkModePage(),
                ),
              );
            },
          ),
          SettingsTile(
            title: 'Export danych',
            icon: Icons.save_alt_outlined,
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExportPage(),
                ),
              );
            },
          ),
          SettingsTile(
            title: 'Import danych',
            icon: Icons.upload_outlined,
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImportPage(),
                ),
              );
            },
          ),
          SettingsTile(
            title: 'Usuń dane',
            icon: Icons.delete_forever_outlined,
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeletePage(),
                ),
              );
            },
          ),
          SettingsTile(
            title: 'Jak używać aplikacji',
            icon: Icons.integration_instructions_outlined,
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntructionPage(),
                ),
              );
            },
          ),
          SettingsTile(
            title: 'Nowe / niedokończone funkcje',
            icon: Icons.new_label_outlined,
            desc: 'Kliknij ikonę, aby otworzyć',
            fn: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeaturesPage(),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
