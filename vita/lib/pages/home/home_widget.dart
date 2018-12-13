import 'package:flutter/material.dart';

import './highlight_reminder.dart';
import 'package:vita/assets/theme/theme.dart';
import 'package:vita/pages/profile/profile_info.dart';

//inspired from https://flutter.io/docs/development/ui/layout

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    Profile profile = getProfile();

    return Scaffold (
      backgroundColor: ThemeColors.grey1,

      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child:
              Container(
                padding: const EdgeInsets.only(left:50.0, right:60.0, top:60.0, bottom:60.0),
                //width: 50.0,
                //height: 50.0,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: AssetImage('assets/images/vita_logo.jpeg'), fit: BoxFit.fitHeight),
                ),
              ),
              //Text(
              //  'Vita',
              //  style: DefaultTextStyle.of(context).style.apply(
              //    fontSizeFactor: 4.0,
              //    color: ThemeColors.lightGreen,
              //),
              //),
          ),
          Column(
            children: <Widget>[
              Text(
                'Hi ${profile.firstName}.\nCheck out some highlights.', //TODO replace with actual name
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
