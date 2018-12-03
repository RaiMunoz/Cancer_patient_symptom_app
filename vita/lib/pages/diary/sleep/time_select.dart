import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';


import '../../../assets/theme/theme.dart';
import 'sleep_entry.dart';
import '../entry_button_generic.dart';

class time_number extends StatelessWidget {
  final int value;

  time_number(this.value);

  String twoDigitString(int i) {
    String s = i.toString();
    if(s.length < 2) s = '0' + s;
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      child: Text(
        twoDigitString(value),
        style: DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: 2.0,
          fontWeightDelta: 2,
          color: ThemeColors.white,
        ),
      ),
      color: ThemeColors.lightGreen,
    );
  }
}

class time_select extends StatefulWidget {
  final List<int> time_options;
  final ValueChanged<int> action;
  final String label;

  const time_select({Key key, this.time_options, this.action, this.label}): super(key: key);

  @override
  _time_select createState() => new _time_select();
}

class _time_select extends State<time_select> {
  int time_val = null;
  int selected = null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            color: ThemeColors.lightGreen,
          ),
          child: PageView.builder(
            itemBuilder: (context, int i) {
              return time_number(i);
            },
            itemCount: widget.time_options.length,
            scrollDirection: Axis.vertical,
            pageSnapping: false,
            onPageChanged: (val) {
              widget.action(val);
              setState(() {
                selected = val;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            widget.label,
            style: TextStyle(color: ThemeColors.white,),
          ),
        ),
      ],
    );
  }
}

