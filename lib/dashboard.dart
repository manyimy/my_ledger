import 'package:flutter/material.dart';

import 'package:my_ledger/addEntryDialog.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/data/gallery_options.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;
  //
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new AddEntryDialog();
                  },
                  fullscreenDialog: true
              ));
              // Navigator.restorablePush<void>(context, _fullscreenDialogRoute);
            }
        ),
        floatingActionButtonLocation: this._fabLocation,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        )
    );
  }
}