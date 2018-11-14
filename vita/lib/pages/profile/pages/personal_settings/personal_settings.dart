import 'package:flutter/material.dart';
import 'package:vita/pages/profile/profile_info.dart';
import 'package:vita/pages/profile/profile_header.dart';
import 'package:vita/pages/profile/menu.dart';
import 'package:vita/assets/theme/theme.dart';
import 'package:vita/placeholder_widget.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _personalSettings extends State<personalSettings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Personal Settings'),
      ),
      body: new PlaceholderWidget(ThemeColors.pink),
    );
  }

}
class personalSettings extends StatefulWidget {
  @override
  _personalSettings createState() => _personalSettings();
}