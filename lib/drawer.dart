import 'package:flutter/material.dart';
import 'package:my_ledger/main.dart';

import 'package:my_ledger/settings.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              height: 10,
              child: const Text(
                'Account',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MyHomePage(title: 'My Ledger');
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsPage(title: "Settings");
              }));
            },
          ),
        ],
      ),
    );
  }
}

enum Pages {
  DASHBOARD,
  SETTINGS,
}