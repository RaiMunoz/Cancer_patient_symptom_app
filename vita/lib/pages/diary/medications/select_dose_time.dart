import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';
import 'medication_entry.dart';
import 'medication.dart';
import '../entry_button_generic.dart';

class select_dose_time extends StatelessWidget {
  final medication_entry entry;
  final medication med;
  select_dose_time(this.entry, this.med);

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
    return Row(
      children: <Widget>[
        FittedBox (
          child: entry_text_field(
            title: 'Time',
            keyboard: TextInputType.datetime,
            saved: (val) {entry.time_taken = convertToDatetime(val);},
          ),
        ),
        entry_text_field(
          title: this.med.dose,
          saved: (val) {entry.dosage = val;},
        ),
      ],
    );
  }
}
