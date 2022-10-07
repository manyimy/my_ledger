import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:my_ledger/addEntryDialog.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/data/gallery_options.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

class DashboardPage extends StatelessWidget {
  static final ValueNotifier<FloatingActionButtonLocation> fabLocation =
  ValueNotifier(FloatingActionButtonLocation.endFloat);

  DashboardPage({Key? key}) : super(key: key);
  var addEntryDialogStateInstance = AddEntryDialogState();
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

  @override
  Widget build(BuildContext context) {
    print("-----in dashboard-----");
    print(addEntryDialogStateInstance.records.toString());
    return ValueListenableBuilder<FloatingActionButtonLocation>(
        valueListenable: fabLocation,
        builder: (_, FloatingActionButtonLocation currentFabLocation, __) {
          return Scaffold(
            body: Column(
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
                  children: addEntryDialogStateInstance.records.map((Record record) {
                    return RecordItem(
                      record: record,
                    );
                  }).toList(),
                ),
              ],
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
    var str = "Cat: " + this.category + "\nMoney: " + this.money.toString() + "\nDate: " + this.date.toString() + "\nDesc: " + this.description;
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