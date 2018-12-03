import 'package:flutter/material.dart';
import 'package:vita/pages/profile/profile_info.dart';
import 'package:vita/pages/profile/profile_header.dart';
import 'package:vita/pages/profile/menu.dart';
import 'package:vita/assets/theme/theme.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _account extends State<account> {
  @override
  Widget build(BuildContext context) {

    Profile profile = getProfile();

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Settings'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new ProfileHeader(profile),
          new menu(),
        ],
      ),
    );
  }

}
class account extends StatefulWidget {
  @override
  _account createState() => _account();
}