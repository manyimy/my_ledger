import 'package:flutter/material.dart';
// import 'package:my_ledger/drawer.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Container(
//           height: 80,
//           margin: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
//           child: const Text("Dark mode"),
//         )
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('settings'),
    );
  }
}