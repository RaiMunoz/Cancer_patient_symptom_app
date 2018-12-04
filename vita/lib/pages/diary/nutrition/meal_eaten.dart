import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';
import 'nutrition_entry.dart';
import '../entry_button_generic.dart';

class meal_eaten extends StatefulWidget {
  final nutrition_entry entry;
  meal_eaten(this.entry);

  @override
  _meal_eaten createState() => new _meal_eaten();
}

class _meal_eaten extends State<meal_eaten> {
  DateTime convertToDatetime(String text) {
    try {
      var dt = new DateFormat.yMd().add_Hm().parseStrict(text);
      print('Time parsed successfully\n');
      return dt;
    } catch (e) {
      return null;
    }
  }

  TimeOfDay meal_time;

  Future<Null> selectTimeTaken(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: meal_time
    );

    if(picked != null && picked != activity_time) {
      setState((){
        meal_time = picked;
      });
      widget.entry.time_eaten = DateFormat.jm().parseStrict(meal_time.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.entry.meal_time == null) {
      widget.entry.meal_time = DateTime.now();
    }
    meal_time = TimeOfDay.fromDateTime(widget.entry.meal_time);

    return Row(
      children: <Widget>[
        FittedBox (
          child: sub_entry_container(
            child: FlatButton(
                child: entry_title("${meal_time.format(context)}"),
                onPressed: () {selectTimeTaken(context);}
            ),
          ),
        ),
        entry_text_field(
          label: 'What did you eat?',
          saved: (val) {widget.entry.food = val;},
        ),
      ],
    );
  }
}
