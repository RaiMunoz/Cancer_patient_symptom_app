import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';

import '../../../assets/theme/theme.dart';
import 'medication_entry.dart';
import 'medication.dart';
import '../entry_button_generic.dart';

class select_dose_time extends StatefulWidget {
  final medication_entry entry;
  final medication med;
  select_dose_time({Key key, this.entry, this.med}): super(key: key);

  @override
  _select_dose_time createState() => new _select_dose_time();
}

class _select_dose_time extends State<select_dose_time> {
  DateTime convertToDatetime(String text) {
    try {
      var dt = new DateFormat.yMd().add_Hm().parseStrict(text);
      print('Time parsed successfully\n');
      return dt;
    } catch (e) {
      return null;
    }
  }

  TimeOfDay time_taken;

  Future<Null> selectTimeTaken(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time_taken
    );

    if(picked != null && picked != time_taken) {
      setState((){
        time_taken = picked;
      });
      widget.entry.time_taken = DateFormat.jm().parseStrict(time_taken.format(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.entry.time_taken == null) {
      widget.entry.time_taken = DateTime.now();
    }
    time_taken = TimeOfDay.fromDateTime(widget.entry.time_taken);

    return Row(
      children: <Widget>[
        sub_entry_container(
          child: FlatButton(
            child: entry_title("${time_taken.format(context)}"),
            onPressed: () {selectTimeTaken(context);}
          ),
        ),
        entry_text_field(
          title: widget.med.dose,
          saved: (val) {widget.entry.dosage = val;},
        ),
      ],
    );
  }
}
