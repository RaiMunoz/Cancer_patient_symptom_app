import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';

import 'highlight_reminder.dart';

import '../profile/account.dart';
import '../diary/diary_main.dart';
import '../messaging/main_message.dart';
import '../analytics/test_viz.dart';
import '../addInformation/add_information.dart';

import '../../placeholder_widget.dart';
import '../../add_diary_entry_widget.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.grey[300],

      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'Vita',
              style: TextStyle(
                fontSize: 60.0,
                color: Colors.lightBlue[400],
                fontFamily: 'Lucida Calligraphy',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
                'Hi Beth.\nCheck out some highlights.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HighlightReminder(Icon(Icons.directions_run), 'Walked 5 miles'),
                  HighlightReminder(Icon(Icons.restaurant), 'Cooked a meal'),
                  HighlightReminder(Icon(Icons.local_florist), 'Went to the park'),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: Text(
              'Some Reminders!',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  HighlightReminder(Icon(Icons.priority_high), 'Take Cytoxan'),
                  HighlightReminder(Icon(Icons.phone), 'Call Dr. Hilton'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
