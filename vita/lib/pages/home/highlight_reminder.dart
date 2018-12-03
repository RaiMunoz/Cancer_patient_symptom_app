import 'package:flutter/material.dart';

import '../../assets/theme/theme.dart';

class HighlightReminder extends StatelessWidget {
  final IconData icon;
  final String text;

  HighlightReminder(this.icon, this.text);

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        color: ThemeColors.lightGreen,
      ),
      child: Row(
        children: <Widget>[
          Text(text, style: TextStyle(color: ThemeColors.white)),
          Icon(icon, color: ThemeColors.white),
        ],
      ),
    );
  }
}