import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_ledger/main.dart';
// import 'package:my_ledger/drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>
  with RestorationMixin {

  // bool _darkMode = false;
  final RestorableBool _darkMode = RestorableBool(false);

  @override
  String get restorationId => 'darkmode_switch';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_darkMode, 'dark_mode');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Darkmode',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 20),
                ),
                CupertinoSwitch(value: _darkMode.value, onChanged: (value) {
                  MyApp.themeNotifier.value =
                  MyApp.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
                  setState(() {
                    _darkMode.value = value;
                  });
                }),
              ],
            ),
          ),
        );
  }
}
