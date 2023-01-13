import 'package:flutter/material.dart';
import 'package:my_ledger/dashboard.dart';
import 'package:my_ledger/main.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEntryDialog extends StatefulWidget {
  const AddEntryDialog({Key? key}) : super(key: key);

  @override
  AddEntryDialogState createState() => AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final List<Record> _records = <Record>[];
  List<Record> get records => _records;

  @override
  void dispose() {
    categoryController.dispose();
    moneyController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void _addRecordItem(String category, double money, DateTime date) {
    var db = FirebaseFirestore.instance;

    // Create a new user with a first and last name
    final expenseRecord = <String, dynamic>{
      "category": category,
      "expense": money,
      "date": date
    };

    // Add a new document with a generated ID
    db.collection("expenses").add(expenseRecord).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));

    setState(() {
      _records.add(Record(category: category, money: money, date: date));
    });
    print("-----records:-----");
    print(_records.toString());
    categoryController.clear();
    moneyController.clear();
    dateController.clear();
  }

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
          actions: [
            TextButton(
                onPressed: () {
                  //TODO: Handle save
                  _addRecordItem(categoryController.text, double.parse(moneyController.text), DateTime.parse(dateController.text));
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => MyHomePage(records: _records)
                  ));                },
                child: Text('SAVE',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white))),
          ],
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter category",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TextFormField(
                    controller: moneyController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter expense",
                    ),
                    validator: (value) {
                      if(value == null) {
                        return null;
                      }
                      final n = num.tryParse(value);
                      if(n == null) {
                        return '"$value" is not a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Pick your date",
                    ),
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)
                      );
                      dateController.text = date.toString().substring(0, 10);
                      print(DateTime.parse(dateController.text));
                    },
                  ),
                )
              ],
            ),
            const Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

// https://daily-dev-tips.com/posts/build-a-todo-list-app-with-flutter/