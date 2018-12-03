import 'package:flutter/material.dart';
import './inbox_screen.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inbox Screen',
      home: InboxScreen(),
    );
  }
}

// want to create an inbox page with multiple contacts and a share VITA link button
// Text that says "Hillman Center Care Team" doctor/PA are at the top
// Under them text that says "Family and Friends" with all contacts in alphabetical order
// At the bottom, option to add a new contact
// FOR EACH CONTACT
// select a contact by clicking a check box next to their name
// PHOTO ---- NAME ---- SELECT BOX
// when you have contacts selected and click Share VITA link (must have at least one contact selected)
// pop up screen that says Share VITA link with the following people:
// list of contacts
// CANCEL OR SEND


//
//
//class InboxButton extends StatelessWidget {
//  final String title;
//  //How to add a second text argument for subtitle?
//  final String sub_title;
//  final VoidCallback action;
//
//  InboxButton(this.title, this.action, this.sub_title);
//
//  @override
//  Widget build(context) {
//    return Container(
//        padding: const EdgeInsets.only(bottom: 15.0),
//        height: 80.0,
//        child: RaisedButton(
//          child: Text(title,
//            //style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.5),
//            style: TextStyle(fontSize: 25.0, color: Colors.white),
//          ),
//          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
//          color: Colors.teal[600],
//          elevation: 6.0,
//          onPressed: action,
//        )
//    );
//  }
//}

