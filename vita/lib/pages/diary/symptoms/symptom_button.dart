import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';
import 'select_severity.dart';
import '../entry_button_generic.dart';

class symptom_button extends StatefulWidget {
  final String title;
  final bool custom;
  final entry = new symptom_entry();

  const symptom_button({Key key, this.title, this.custom}): super(key: key);

  void submitForm() {
    entry.custom = this.custom;
    if(!this.custom) this.entry.symptom_name = this.title;
    this.entry.time = DateTime.now();
    if(this.entry.severity == null) this.entry.severity = 1; // unset vals get entered as minimum? idk what to do there

    var contactService = new ContactServiceSymptom();
    contactService.createSymptomEntry(this.entry);
    print('Created entry: \nSymptom name: ' + this.entry.symptom_name +
        '\nSeverity: ' + this.entry.severity.toString() +
        '\nTime: ' + DateFormat.yMd().add_jm().format(this.entry.time) +
        '\nCustom: ' + this.entry.custom.toString()
    );
  }

  @override
  _symptom_button createState() => new _symptom_button();
}

class _symptom_button extends State<symptom_button> {
  int severity = 1;

  @override
  Widget build(BuildContext) {
    var width = MediaQuery.of(context).size.width;
    Widget title_widget;
    if(widget.custom) {
      title_widget = Row(
        children: <Widget>[
          entry_title('Other:'),
          Padding(padding: EdgeInsets.only(left: width / 20)),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (val) {widget.entry.symptom_name = val;},
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'Symptom Name',),
            ),
          ),
        ],
      );
    }
    else {
      title_widget = entry_title(widget.title);
    }

    return entry_button_generic(
      title: title_widget,
      children: <Widget>[
        FittedBox(
          child: select_severity(entry: widget.entry),
        ),
      ],
      action: (val){},
    );
  }
}
