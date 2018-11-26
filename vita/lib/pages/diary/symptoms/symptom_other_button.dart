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
    entry.time = DateTime.now();
    entry.custom = true;
    if(entry.symptom_name != null && entry.severity != null) { // no severity was selected
      var contactService = new ContactServiceSymptom();
      contactService.createSymptomEntry(entry);
      print(
          'Created entry: \nSymptom name: ' + entry.symptom_name +
          '\nSeverity: ' + entry.severity.toString() +
          '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time) +
          '\nCustom: ' + entry.custom.toString()
      );
    }
  }

  @override
  Widget build(BuildContext) {
    var width = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: entry_button_generic(
        title: Row(
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
        ),
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
