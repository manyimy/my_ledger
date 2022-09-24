import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  const AddEntryDialog({Key? key}) : super(key: key);

  @override
  AddEntryDialogState createState() => AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Expense'),
              Tab(text: 'Income'),
            ],
          ),
          title: const Text('New Record'),
          // actions: [
          //   TextButton(
          //       onPressed: () {
          //         //TODO: Handle save
          //       },
          //       child: Text('SAVE',
          //           style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white))),
          // ],
        ),
        // body: const TabBarView(
        //   children: [
        //     Icon(Icons.directions_car),
        //     Icon(Icons.directions_transit),
        //   ],
        // ),
      ),
    );
  }
}