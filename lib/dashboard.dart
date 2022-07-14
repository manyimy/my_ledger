import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
import 'package:gallery/data/gallery_options.dart';
import 'package:gallery/demos/material/material_demo_types.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.endDocked;

  static Route<void> _fullscreenDialogRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return MaterialPageRoute<void>(
      builder: (context) => _FullScreenDialogDemo(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => {
            Navigator.restorablePush<void>(context, _fullscreenDialogRoute);
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

class _FullScreenDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = GalleryLocalizations.of(context)!;

    // Remove the MediaQuery padding because the demo is rendered inside of a
    // different page that already accounts for this padding.
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ApplyTextOptions(
        child: Scaffold(
          appBar: AppBar(
            title: Text(localizations.dialogFullscreenTitle),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  localizations.dialogFullscreenSave,
                  style: theme.textTheme.bodyText2!.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: Text(
              localizations.dialogFullscreenDescription,
            ),
          ),
        ),
      ),
    );
  }
}