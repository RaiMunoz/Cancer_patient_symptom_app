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

  const symptom_button({Key key, this.title, this.custom}): super(key: key);

  @override
  _symptom_button createState() => new _symptom_button();
}

class _symptom_button extends State<symptom_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = 1;
  symptom_entry entry = new symptom_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.custom = widget.custom;
    if(!widget.custom) entry.symptom_name = widget.title;
    entry.time = DateTime.now();
    if(entry.severity != null) {
      var contactService = new ContactServiceSymptom();
      contactService.createSymptomEntry(entry);
      print('Created entry: \nSymptom name: ' + entry.symptom_name +
          '\nSeverity: ' + entry.severity.toString() +
          '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time) +
          '\nCustom: ' + entry.custom.toString()
      );
    }
  }

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
              onSaved: (val) {entry.symptom_name = val;},
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

    return Form(
      key: formKey,
      child: entry_button_generic(
        title: entry_title(widget.title),
        children: <Widget>[
          FittedBox(
            child: select_severity(entry: entry),
          ),
        ],
        action: (expanded) {
          if(!expanded) submitForm();
        },
      ),
    );
  }
}
