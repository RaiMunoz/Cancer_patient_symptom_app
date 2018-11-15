import 'package:flutter/material.dart';

class HighlightReminder extends StatelessWidget {
  final Widget icon;
  final String text;

  HighlightReminder(this.icon, this.text);

  @override
  Widget build(context) {
    return Padding(
      child: RaisedButton.icon(
        icon: icon,
        label: Text(text),
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        disabledColor: Colors.blueGrey[400],
        disabledTextColor: Colors.white,
        onPressed: null,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
    );
  }
}