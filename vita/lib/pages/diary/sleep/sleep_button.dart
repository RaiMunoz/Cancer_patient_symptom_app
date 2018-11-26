import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'sleep_entry.dart';
import 'contact_service_sleep.dart';
import 'time_select.dart';
import '../entry_button_generic.dart';

class sleep_button extends StatefulWidget {
  const sleep_button({Key key}): super(key: key);

  @override
  _sleep_button createState() => new _sleep_button();
}

class _sleep_button extends State<sleep_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  sleep_entry entry = new sleep_entry();
  List<int> hour_options = List<int>.generate(24, (i) => i);
  List<int> minute_options = List<int>.generate(60, (i) => i);
  int hour = 0;
  int minute = 0;

  void sendToService() {
    entry.hours = hour.toDouble() + minute.toDouble() / 60.0;
    entry.night = DateTime.now().subtract(Duration(days:1));

    var contactService = new ContactServiceSleep();
    contactService.createSleepEntry(entry);
    print('Created entry: \nHours slept: ' + entry.hours.toString() +
        '\nNight: ' + DateFormat.yMd().format(entry.night));
  }

  @override
  Widget build(BuildContext) {
    var square_side = MediaQuery.of(context).size.width * 0.8;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: ThemeColors.lightGreen,
      ),
      width: square_side,
      height: square_side,
      child: Column(
        children: <Widget>[
          Text(
            'How many hours did you sleep last night?',
            textAlign: TextAlign.center,
            style: DefaultTextStyle.of(context).style.apply(
              fontSizeFactor: 1.25,
              fontWeightDelta: 2,
              color: ThemeColors.white,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                time_select(
                  time_options: hour_options,
                  action: (val) {hour = val;},
                  label: 'Hours',
                ),
                time_select(
                  time_options: minute_options,
                  action: (val) {minute = val;},
                  label: 'Minutes',
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text('Done'),
            onPressed: sendToService,
            color: ThemeColors.grey2,
          ),
        ],
      ),
    );
  }
}
