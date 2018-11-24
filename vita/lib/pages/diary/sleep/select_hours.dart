import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';


import '../../../assets/theme/theme.dart';
import 'sleep_entry.dart';
import '../entry_button_generic.dart';

class time_dropdown extends StatefulWidget {
  final List<int> time_options;
  final ValueChanged<int> action;

  const time_dropdown({Key key, this.time_options, this.action}): super(key: key);

  @override
  _time_dropdown createState() => new _time_dropdown();
}

class _time_dropdown extends State<time_dropdown> {
  int time_val = null;
  int selected = null;

  String twoDigitString(int i) {
    String s = i.toString();
    if(s.length < 2) s = '0' + s;
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: ThemeColors.darkGreen,
      ),
      child: ListView.builder(
        itemBuilder: (context, int i) {
          return FlatButton(
            child: Text(twoDigitString(i)),
            color: (selected == i) ? Colors.white : ThemeColors.darkGreen,
            onPressed: () {
              widget.action(i);
              setState(() {
               selected = i;
              });
            }
          );
        },
        itemCount: widget.time_options.length,
      ),
    );
  }
}

