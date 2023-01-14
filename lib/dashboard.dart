import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:my_ledger/addEntryDialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardPage extends StatelessWidget {
  static final ValueNotifier<FloatingActionButtonLocation> fabLocation =
  ValueNotifier(FloatingActionButtonLocation.endFloat);

  List<Record> records = <Record>[];
  var addEntryDialogStateInstance = AddEntryDialogState();
  var db = FirebaseFirestore.instance;

  // static Route<void> _fullscreenDialogRoute(
  //     BuildContext context,
  //     Object? arguments,
  //     ) {
  //   return MaterialPageRoute<void>(
  //     builder: (context) => _openAddEntryDialog(),
  //     fullscreenDialog: true,
  //   );
  // }

  // void _openAddEntryDialog() {
  //   Navigator.of(context).push(new MaterialPageRoute<Null>(
  //       builder: (BuildContext context) {
  //         return new AddEntryDialog();
  //       },
  //       fullscreenDialog: true
  //   ));
  // }
  Future<List<Record>> getData() async {
    records = [];
    await db.collection("expenses").get().then((event) {
      print("in firestore get data");
      for (var doc in event.docs) {
        print(doc.data()["category"]);
        print("${doc.id} => ${doc.data()}");
        records.add(
            Record( category: doc.data()["category"],
                money: doc.data()["money"],
                date: doc.data()["date"].toDate(),
                description: (doc.data()["description"] != null) ? doc.data()["description"] : ""
            )
        );
      }
    });
    print(records.toString());
    return records;
  }

  @override
  Widget build(BuildContext context) {

    print("-----in dashboard-----");

    return ValueListenableBuilder<FloatingActionButtonLocation>(
        valueListenable: fabLocation,
        builder: (_, FloatingActionButtonLocation currentFabLocation, __) {
          return Scaffold(
            body: FutureBuilder(
              future: getData(),
              builder: (ctx, snapshot) {
                // Checking if future is resolved or not
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data as List<Record>;
                    return Column(
                        children: [
                          const Text('Deliver features faster'),
                          const Divider(
                            color: Colors.grey, //color of divider
                            height: 25, //height spacing of divider
                            thickness: 0.5, //thickness of divider line
                            indent: 30, //spacing at the start of divider
                            endIndent: 30, //spacing at the end of divider
                          ),
                          const Text('Deliver features faster'),
                          ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            // children: addEntryDialogStateInstance.records.map((Record record) {
                            children: records.map((Record record) {
                              return RecordItem(
                                record: record,
                              );
                            }).toList(),
                          ),
                        ],
                    );
                  }
                }

                // Displaying LoadingSpinner to indicate waiting state
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            ),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  // timeDilation = 5.0; // slow down animation
                  Navigator.of(context).push( MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const AddEntryDialog();
                      },
                      fullscreenDialog: true
                  ));
                  // Navigator.restorablePush<void>(context, _fullscreenDialogRoute);
                }
            ),
            floatingActionButtonLocation: currentFabLocation,
            // bottomNavigationBar: BottomAppBar(
            //   color: Colors.blue,
            //   shape: CircularNotchedRectangle(),
            //   child: Container(
            //     height: 50.0,
            //   ),
            // )
        );
        }
    );
  }
}

class Record {
  Record({required this.category, required this.money, required this.date, this.description=""});
  final String category;
  double money;
  DateTime date;
  String description;
  @override
  String toString() {
    // TODO: implement toString
    var str = "Cat: " + this.category + "\nMoney: " + this.money.toStringAsFixed(2) + "\nDate: " + this.date.toString() + "\nDesc: " + this.description;
    return str;
  }
}

class RecordItem extends StatelessWidget{
  RecordItem({
    required this.record,
  }) : super(key: ObjectKey(record));

  final Record record;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // TODO: View details
      },
      leading: CircleAvatar(
        child: Text(record.category[0]),
      ),
      // title: Text(record.category),
      title: Text((record.description != "" ? record.description : "${record.category} ${record.money}")),
    );
  }
}