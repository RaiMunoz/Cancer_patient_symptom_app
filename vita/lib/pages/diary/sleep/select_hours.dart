import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';


import '../../../assets/theme/theme.dart';
import 'sleep_entry.dart';
import '../entry_button_generic.dart';

class time_dropdown extends StatefulWidget {
  final int time_val;
  final List<int> time_options;
  final ValueChanged<int> action;

  const time_dropdown({Key key, this.time_val, this.time_options, this.action}): super(key: key);

  @override
  _time_dropdown createState() => new _time_dropdown();
}

class _time_dropdown extends State<time_dropdown> {
  int tmp = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: ThemeColors.darkGreen,
      ),
      child:DropdownButton<int>(
        value: tmp,
        items: widget.time_options.map((int value) {
          return new DropdownMenuItem<int>(
            value: value,
            child: new Text(value.toString()),
          );
        }).toList(),
        onChanged: (val) {
          widget.action(val);
          setState(() {
            tmp = val;
          });
        },
      ),
    );
  }
}

/*class select_hours extends StatefulWidget {
  final sleep_entry entry;

  select_hours({Key key, this.entry}): super(key: key);

  @override
  _select_hours createState() => new _select_hours();
}

class _select_hours extends State<select_hours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}*/
