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
          child: select_hours(),/*Text(
              'How many hours did you sleep last night?',
              style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: 1.25,
                color: Colors.white,
                fontWeightDelta: 1,
              ),
          ),*/
        ),
        alignment: Alignment(0.0, 0.0),
      ),
      /*child: entry_button_generic(
        title: 'How much did you sleep last night?',
        children: <Widget>[
          FittedBox(
            child: select_hours(/*entry*/),
          ),
        ],
        action: (expanded) {
          if(!expanded) submitForm();
        },
      ),*/
    );
  }
}
