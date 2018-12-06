
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'medication_entry.dart';
import 'medication.dart';
import 'contact_service_medication.dart';
import 'select_dose_time.dart';
import 'medication_settings.dart';
import '../entry_button_generic.dart';
import 'package:vita/pages/login/login_auth.dart';

class medication_button extends StatefulWidget {
  final String title;
  final medication med;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final entry = new medication_entry();
  final loginAuthImplement auth;

  medication_button({Key key, this.title, this.med, this.auth}): super(key: key);

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.medication_name = title;
    DateTime time_submit = DateTime.now();

    if(entry.dosage != null && entry.dosage != '' && entry.time_taken != null) {
      var contactService = new ContactServiceMedication(auth,time_submit);
      var db_return=contactService.submit_entry(entry);

      print('Created entry: \nMedication name: ' + entry.medication_name +
          '\nDosage: ' + entry.dosage +
          '\nTime taken: ' + DateFormat.yMd().add_jm().format(entry.time_taken));
    }
  }

  @override
  _medication_button createState() => new _medication_button();
}

class _medication_button extends State<medication_button> {
  int severity = null;
  String display_value = 'Show Settings';

  @override
  Widget build(BuildContext) {
    if(widget.entry.dosage == null) {
      widget.entry.dosage = widget.med.dose;
    }

    return Form(
      key: widget.formKey,
      child: entry_button_generic(
        title: entry_title(widget.med.name),
        children: <Widget>[
          FittedBox(
            child: select_dose_time(entry: widget.entry, med: widget.med),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ExpansionTile(
              title: Text(
                display_value,
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.black),
              ),
              children: [medication_settings(widget.med)],
              onExpansionChanged: (expanded) {
                setState(() {
                  if(expanded) display_value = 'Hide Settings';
                  else display_value = 'Show Settings';
                });
              },
              trailing: Icon(Icons.settings),
            ),
          ),
        ],
        action: (expanded) {},
      ),
    );
  }
}
