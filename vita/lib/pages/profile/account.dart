import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vita/pages/profile/profile_info.dart';
import 'package:vita/pages/profile/profile_colors.dart';
import 'package:vita/pages/profile/profile_icons.dart';
import 'package:vita/pages/profile/profile_header.dart';
import 'package:vita/pages/profile/quick_actions.dart';
import 'package:vita/pages/profile/menu.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _account extends State<account> {
  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFF00BCD4);//0xFFCCCCCC);
    final navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.home, color: iconColor),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.bookmark, color: iconColor,),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.thumbsUp, color: iconColor,),
          title: new Text("")),
      new BottomNavigationBarItem(
          icon: new Icon(
            LineAwesomeIcons.user, color: ProfileColors.primaryColor,),
          title: new Text(""))
    ];

    final profile = getProfile();

    return new Scaffold(
      body: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new ProfileHeader(profile),
         // new QuickActions(),
          new menu(),
        ],
      ),
      //bottomNavigationBar: new BottomNavigationBar(
       // currentIndex: 0,
       // items: navigationItems,
       // onTap: (index) {},
       // fixedColor: ProfileColors.primaryColor,
      //  iconSize: 25.0,
      //  type: BottomNavigationBarType.fixed,
      //),
    );
  }

}
class account extends StatefulWidget {
  @override
  _account createState() => _account();
}