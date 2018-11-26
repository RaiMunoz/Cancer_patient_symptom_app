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

  const symptom_button({Key key, this.title}): super(key: key);

  @override
  _symptom_button createState() => new _symptom_button();
}

class _symptom_button extends State<symptom_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = null;
  symptom_entry entry = new symptom_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.symptom_name = widget.title;
    entry.time = DateTime.now();
    if(entry.severity != null) { // no severity was selected
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
