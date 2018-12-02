
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'medication_entry.dart';
import 'medication.dart';
import 'contact_service_medication.dart';
import 'select_dose_time.dart';
import '../entry_button_generic.dart';

class medication_button extends StatefulWidget {
  final String title;
  final medication med;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final entry = new medication_entry();

  const medication_button({Key key, this.title, this.med}): super(key: key);

  void submitForm() {
    print('here');
    final FormState form = formKey.currentState;

    form.save();
    entry.medication_name = title;
    if(entry.dosage != null && entry.dosage != '' && entry.time_taken != null) {
      var contactService = new ContactServiceMedication();
      contactService.createMedicationEntry(entry);
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

  /*void submitForm() {
    final FormState form = widget.formKey.currentState;

    form.save();
    entry.medication_name = widget.title;
    if(entry.dosage != null && entry.dosage != '' && entry.time_taken != null) {
      var contactService = new ContactServiceMedication();
      contactService.createMedicationEntry(entry);
      print('Created entry: \nMedication name: ' + entry.medication_name +
          '\nDosage: ' + entry.dosage +
          '\nTime taken: ' + DateFormat.yMd().add_jm().format(entry.time_taken));
    }
  }*/

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
        ],
        action: (expanded) {
          //if(!expanded) this.submitForm();
        },
      ),
    );
  }
}
