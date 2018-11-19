import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';
import 'medication_entry.dart';

class dose_button extends StatelessWidget {
  final medication_entry entry;

  dose_button(this.entry);

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      decoration: const InputDecoration(
        hintText: 'Dosage',
      ),
      onSaved: (val) {entry.dosage = val;},
    );
  }
}

// TODO: update time entry to allow easier am/pm
class time_button extends StatelessWidget {
  final medication_entry entry;

  time_button(this.entry);

  DateTime convertToDatetime(String text) {
    try {
      var dt = new DateFormat.yMd().add_Hm().parseStrict(text);
      print('Time parsed successfully\n');
      return dt;
    } catch (e) {
      return null;
    }
  }

  @override

  Widget build(BuildContext context) {
    return new TextFormField(
      decoration: const InputDecoration(
        hintText: 'Time',
      ),
      keyboardType: TextInputType.datetime,
      onSaved: (val) {entry.time_taken = convertToDatetime(val);},
    );
  }
}

class select_dose_time extends StatelessWidget {
  final medication_entry entry;
  select_dose_time(this.entry);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100.0,
          child: time_button(entry),
        ),
        Container(
          width: 100.0,
          child: dose_button(entry),
        ),
      ],
    );
  }
}
