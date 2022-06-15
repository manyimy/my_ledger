// import 'package:flutter/material.dart';
// import 'package:my_ledger/main.dart';
//
// import 'package:my_ledger/dashboard.dart';
// import 'package:my_ledger/settings.dart';
//
// class MyDrawer extends State<MyHomePage> {
//   List<Widget> bodyWidgets = [DashboardPage(), SettingsPage()];
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text('Drawer Header'),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: const Text('Dashboard'),
//             onTap: () {
//               setState(() {
//                 index = 0;
//                 setTitle(title: 'My Ledger');
//                 Navigator.pop(context);
//               });
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () {
//               setState(() {
//                 index = 1;
//                 setTitle(title: 'Settings');
//                 Navigator.pop(context);
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// enum Pages {
//   DASHBOARD,
//   SETTINGS,
// }