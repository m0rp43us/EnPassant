import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/components/settings_view/piece_theme_picker.dart';
import 'package:en_passant/views/components/settings_view/toggle.dart';
import 'package:en_passant/views/components/shared/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'components/settings_view/app_theme_picker.dart';
import 'components/shared/bottom_padding.dart';
import 'components/shared/text_variable.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, appModel, child) => Container(
        decoration: BoxDecoration(gradient: appModel.theme.background),
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            TextLarge('Settings'),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                children: [
                  AppThemePicker(),
                  SizedBox(height: 20),
                  PieceThemePicker(),
                  SizedBox(height: 20),
                  Toggle(
                    'Show Hints',
                    toggle: appModel.showHints,
                    setFunc: appModel.setShowHints,
                  ),
                  Toggle(
                    'Allow Undo/Redo',
                    toggle: appModel.allowUndoRedo,
                    setFunc: appModel.setAllowUndoRedo
                  ),
                  Toggle(
                    'Show Move History',
                    toggle: appModel.showMoveHistory,
                    setFunc: appModel.setShowMoveHistory
                  ),
                  Toggle(
                    'Flip Board For Black',
                    toggle: appModel.flip,
                    setFunc: appModel.setFlipBoard
                  ),
                  Toggle(
                    'Sound Enabled',
                    toggle: appModel.soundEnabled,
                    setFunc: appModel.setSoundEnabled
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            RoundedButton('Back', onPressed: () {
              Navigator.pop(context);
            }),
            BottomPadding()
          ],
        )
      )
    );
  }
}