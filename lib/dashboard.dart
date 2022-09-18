import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:my_ledger/addEntryDialog.dart';
// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import 'package:gallery/data/gallery_options.dart';
// import 'package:gallery/demos/material/material_demo_types.dart';

class DashboardPage extends StatelessWidget {
  static final ValueNotifier<FloatingActionButtonLocation> fabLocation =
  ValueNotifier(FloatingActionButtonLocation.endDocked);

  const DashboardPage({Key? key}) : super(key: key);

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
    return ValueListenableBuilder<FloatingActionButtonLocation>(
        valueListenable: fabLocation,
        builder: (_, FloatingActionButtonLocation currentFabLocation, __) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    // timeDilation = 5.0; // slow down animation
                    Navigator.of(context).push( MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return const AddEntryDialog();
                        },
                        fullscreenDialog: true
                    ));
                    // Navigator.restorablePush<void>(context, _fullscreenDialogRoute);
                  }
              ),
              floatingActionButtonLocation: currentFabLocation,
              bottomNavigationBar: BottomAppBar(
                color: Colors.blue,
                shape: CircularNotchedRectangle(),
                child: Container(
                  height: 50.0,
                ),
              )
          );
        }
    );
  }
}