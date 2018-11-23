import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'sleep_entry.dart';
import 'contact_service_sleep.dart';
import 'select_hours.dart';
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
  int hour = null;
  int minute = null;

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.night = DateTime.now().subtract(Duration(days:1));
    if(entry.hours != null) { // no severity was selected
      var contactService = new ContactServiceSleep();
      contactService.createSleepEntry(entry);
      print('Created entry: \nHours slept: ' + entry.hours.toString() +
          '\nNight: ' + DateFormat.yMd().format(entry.night));
    }
  }

  void set_hours() {
    double sum = 0;
    if(hour != null) sum += hour.toDouble();
    if(minute != null) sum += minute.toDouble() / 60.0;

    entry.hours = sum;
    print(entry.hours.toString());
  }

  @override
  Widget build(BuildContext) {
    return Form(
      key: formKey,
      child: Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(5.0),
          alignment: Alignment(0.0, 0.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: ThemeColors.darkGreen,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: <Widget>[
              DropdownButton<int>(
                value: hour,
                items: hour_options.map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    hour = val;
                    set_hours();
                  });
                },
              ),
              DropdownButton<int>(
                value: minute,
                items: minute_options.map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Text(value.toString()),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    minute = val;
                    set_hours();
                  });
                },
              ),
            ],
          ),
        ),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
