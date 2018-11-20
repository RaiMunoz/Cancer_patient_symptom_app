import 'package:flutter/material.dart';

class InboxButton extends StatelessWidget {
  final String title;

  //How to add a second text argument for subtitle?
  //final String sub_title;
  final VoidCallback action;

  InboxButton(this.title, this.action);

  @override
  Widget build(context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 15.0),
        height: 80.0,
        child: RaisedButton(
          child: Text(
            title,
            //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5),
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Colors.teal[600],
          elevation: 6.0,
          onPressed: action,
        ));
  }
}
