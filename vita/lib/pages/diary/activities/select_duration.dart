import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';
import 'activity_entry.dart';
import '../entry_button_generic.dart';

class select_duration extends StatefulWidget {
  final activity_entry entry;
  select_duration(this.entry);

  @override
  _select_duration createState() => new _select_duration();
}

class _select_duration extends State<select_duration> {
  DateTime convertToDatetime(String text) {
    try {
      var dt = new DateFormat.yMd().add_Hm().parseStrict(text);
      print('Time parsed successfully\n');
      return dt;
    } catch (e) {
      return null;
    }
  }

  TimeOfDay activity_time;

  Future<Null> selectTimeTaken(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: activity_time
    );

    if(picked != null && picked != activity_time) {
      setState((){
        activity_time = picked;
      });
      widget.entry.start_time = DateFormat.jm().parseStrict(activity_time.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.entry.start_time == null) {
      widget.entry.start_time = DateTime.now();
    }
    activity_time = TimeOfDay.fromDateTime(widget.entry.start_time);

    return Row(
      children: <Widget>[
        FittedBox (
          child: sub_entry_container(
            child: FlatButton(
                child: entry_title("${activity_time.format(context)}"),
                onPressed: () {selectTimeTaken(context);}
            ),
          ),
        ),
        entry_text_field(
          label: 'How long?',
          saved: (val) {widget.entry.duration = val;},
        ),
      ],
    );
  }
}
