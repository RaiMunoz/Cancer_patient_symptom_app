import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'dart:async';

import './highlight_reminder.dart';
import '../../assets/theme/theme.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold (
      backgroundColor: ThemeColors.grey2,

      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Vita',
            style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 4.0,
              color: ThemeColors.darkGreen,
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                'Hi Beth.\nCheck out some highlights.', //TODO replace with actual name
                textAlign: TextAlign.center,
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.only(top: 10.0),
                height: height * 0.15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[ // TODO replace with actual highlights
                    HighlightReminder(Icons.directions_run, 'Walked 5 miles'),
                    HighlightReminder(Icons.restaurant, 'Cooked a meal'),
                    HighlightReminder(Icons.local_florist, 'Went to the park'),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                'Some Reminders!',
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1.3),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.only(top: 10.0),
                height: height * 0.15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[ // TODO replace with actual reminders
                    HighlightReminder(Icons.priority_high, 'Take Cytoxan'),
                    HighlightReminder(Icons.phone, 'Call Dr. Hilton'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
