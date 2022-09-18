import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ledger/dashboard.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

import 'package:my_ledger/main.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>
  with RestorationMixin {

  // bool _darkMode = false;
  final RestorableBool _darkMode = RestorableBool(false);
  final RestorableInt _currentFabLocation = RestorableInt(2);

  @override
  String get restorationId => 'darkmode_fablocation';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_darkMode, 'dark_mode');
    registerForRestoration(_currentFabLocation, 'fab_location');
  }

  void _onThemeModeChanged(bool value) {
    MyApp.themeNotifier.value =
    MyApp.themeNotifier.value == ThemeMode.light
        ? ThemeMode.dark : ThemeMode.light;
    setState(() {
      _darkMode.value = value;
    });
  }

  void _onFabLocationChanged(int? value) {
    DashboardPage.fabLocation.value = _fabLocations[value!];
    setState(() {
      _currentFabLocation.value = value;
    });
  }

  @override
  void dispose() {
    _darkMode.dispose();
    _currentFabLocation.dispose();
    super.dispose();
  }

  static const List<FloatingActionButtonLocation> _fabLocations = [
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.endDocked,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 88),
      children: [
        SwitchListTile(
          title: Text('Dark Mode'),
          value: _darkMode.value,
          onChanged: _onThemeModeChanged,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Floating Action Button Position'),
        ),
        RadioListTile<int>(
          title: Text('Docked - Left'),
          value: 0,
          groupValue: _currentFabLocation.value,
          onChanged: _onFabLocationChanged,
        ),
        RadioListTile<int>(
          title: Text('Docked - Center'),
          value: 1,
          groupValue: _currentFabLocation.value,
          onChanged: _onFabLocationChanged,
        ),
        RadioListTile<int>(
          title: Text('Docked - Right'),
          value: 2,
          groupValue: _currentFabLocation.value,
          onChanged: _onFabLocationChanged,
        )
      ],
    );
    // return Container(
    //       margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
    //       child: Card(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const Text(
    //               'Darkmode',
    //               textAlign: TextAlign.left,
    //               style: const TextStyle(fontSize: 20),
    //             ),
    //             CupertinoSwitch(value: _darkMode.value, onChanged: (value) {
    //               MyApp.themeNotifier.value =
    //               MyApp.themeNotifier.value == ThemeMode.light
    //                   ? ThemeMode.dark
    //                   : ThemeMode.light;
    //               setState(() {
    //                 _darkMode.value = value;
    //               });
    //             }),
    //           ],
    //         ),
    //       ),
    //     );
  }
}
