import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'activity_button.dart';
import '../../../assets/constants/activities.dart';

class diary_activities extends StatefulWidget {
  diary_activities();

  @override
  _diary_activities createState() => new _diary_activities();
}

class _diary_activities extends State<diary_activities> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Activity'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder:
            (context, int i) {
          return activity_button(title: activities[i]);
        },
        itemCount: activities.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
