import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';


import '../../../assets/theme/theme.dart';
import 'sleep_entry.dart';
import '../entry_button_generic.dart';

class select_hours extends StatefulWidget {
  //final sleep_entry entry;

  select_hours({Key key/*, this.entry*/}): super(key: key);

  @override
  _select_hours createState() => new _select_hours();
}

class _select_hours extends State<select_hours> {
  List<int> hour_options = List<int>.generate(24, (i) => i);
  List<int> minute_options = List<int>.generate(60, (i) => i);
  int hour = 0;
  int minute = 0;

  @override
  Widget build(BuildContext context) {
    print(hour_options.toString());
    return Row(
      children: <Widget>[
        DropdownButton<int>(
          items: hour_options.map((int value) {
            return new DropdownMenuItem<int>(
              value: value,
              child: new Text(value.toString()),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButton<int>(
          items: minute_options.map((int value) {
            return new DropdownMenuItem<int>(
              value: value,
              child: new Text(value.toString()),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
