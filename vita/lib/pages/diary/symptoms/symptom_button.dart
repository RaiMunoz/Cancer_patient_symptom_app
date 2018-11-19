import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';
import 'select_severity.dart';

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
          '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time));
    }
  }

  @override
  Widget build(BuildContext) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
          color: ThemeColors.lightGreen,
        ),
        child: ExpansionTile(
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
          children: <Widget>[
            FittedBox(
              child: select_severity(entry),
            ),
          ],
          onExpansionChanged: (expanded) {
            if(!expanded) submitForm();
          },
          backgroundColor: ThemeColors.lightGreen,
          trailing: Icon(Icons.add_circle),
        ),
      ),
    );
  }
}
