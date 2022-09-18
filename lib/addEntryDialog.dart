import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  const AddEntryDialog({Key? key}) : super(key: key);

  @override
  AddEntryDialogState createState() => AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New entry'),
        actions: [
          TextButton(
              onPressed: () {
                //TODO: Handle save
              },
              child: Text('SAVE',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white))),
        ],
      ),
      body: const Text("Foo"),
    );
  }
}