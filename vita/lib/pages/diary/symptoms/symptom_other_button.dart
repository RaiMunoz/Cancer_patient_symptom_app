import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';
import 'select_severity.dart';
import '../entry_button_generic.dart';

class symptom_other_button extends StatefulWidget {
  const symptom_other_button({Key key}): super(key: key);

  @override
  _symptom_other_button createState() => new _symptom_other_button();
}

class _symptom_other_button extends State<symptom_other_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = null;
  symptom_entry entry = new symptom_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    //entry.symptom_name = 'other'; // TODO change this
    entry.time = DateTime.now();
    if(entry.severity != null) { // no severity was selected
      var contactService = new ContactServiceSymptom();
      contactService.createSymptomEntry(entry);
      print('Created entry: \nSymptom name: ' + entry.symptom_name +
          '\nSeverity: ' + entry.severity.toString() +
          '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time));
    }
  }

  @override
  Widget build(BuildContext) {
    return Form(
      key: formKey,
      child: entry_button_generic(
        title: Row(
          children: <Widget>[
            entry_title('Other:'),
            Expanded(
                child: TextFormField(
                  onSaved: (val) {entry.symptom_name = 'Other: ' + val;},
                ),
              ),
          ],
        ),
        children: <Widget>[
          FittedBox(
            child: select_severity(entry),
          ),
        ],
        action: (expanded) {
          if(!expanded) submitForm();
        },
      ),
    );
  }
}
