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

class medication_settings extends StatefulWidget {
  final medication_entry entry;

  medication_settings({Key key, this.entry}): super(key: key);

  @override
  _medication_settings createState() => new _medication_settings();
}

class _medication_settings extends State<medication_settings> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}