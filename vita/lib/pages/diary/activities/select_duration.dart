import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';
import 'activity_entry.dart';
import '../entry_button_generic.dart';

class select_duration extends StatelessWidget {
  final activity_entry entry;

  select_duration(this.entry);

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
        FittedBox(
          child: entry_text_field(
            title: 'When?',
            keyboard: TextInputType.datetime,
            saved: (val) {
              entry.start_time = convertToDatetime(val);
            },
          ),
        ),
        entry_text_field(
          title: 'How long?',
          saved: (val) {
            entry.duration = val;
          },
        ),
      ],
    );
  }
}
