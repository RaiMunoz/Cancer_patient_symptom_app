
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'medication_entry.dart';
import 'contact_service_medication.dart';
import 'select_dose_time.dart';
import '../entry_button_generic.dart';

class medication_button extends StatefulWidget {
  final String title;

  const medication_button({Key key, this.title}): super(key: key);

  @override
  _medication_button createState() => new _medication_button();
}

class _medication_button extends State<medication_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = null;
  medication_entry entry = new medication_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.medication_name = widget.title;
    //entry.time_taken = DateTime.now(); // delete this line
    if(entry.dosage != null && entry.time_taken != null) {
      var contactService = new ContactServiceMedication();
      contactService.createMedicationEntry(entry);
      print('Created entry: \nMedication name: ' + entry.medication_name +
          '\nDosage: ' + entry.dosage +
          '\nTime taken: ' + DateFormat.yMd().add_jm().format(entry.time_taken));
    }
  }

  @override
  Widget build(BuildContext) {
    return Form(
      key: formKey,
      child: entry_button_generic(
        title: widget.title,
        children: <Widget>[
          FittedBox(
            child: select_dose_time(entry),
          ),
        ],
        action: (expanded) {
          if(!expanded) submitForm();
        },
      ),
    );
  }
}
