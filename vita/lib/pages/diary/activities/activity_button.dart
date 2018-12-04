
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'activity_entry.dart';
import 'contact_service_activity.dart';
import 'select_duration.dart';
import '../entry_button_generic.dart';

class activity_button extends StatefulWidget {
  final String title;
  final activity_entry entry = new activity_entry();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  activity_button({this.title});

  void submitForm() {
    final FormState form = formKey.currentState;
    form.save();

    entry.activity_name = title;
    if(entry.start_time != null && entry.duration != null) {
      var contactService = new ContactServiceActivity();
      contactService.createActivityEntry(entry);
      print('Submitted ' + entry.activity_name);
    }
  }

  @override
  _activity_button createState() => new _activity_button();
}

class _activity_button extends State<activity_button> {
  @override
  Widget build(BuildContext) {
    return Form(
      key: widget.formKey,
      child: entry_button_generic(
        title: entry_title(widget.title),
        children: <Widget>[
          FittedBox(
            child: select_duration(widget.entry),
          ),
        ],
        action: (expanded) {
          if(!expanded) {
            FormState form = widget.formKey.currentState;
            form.save();
          }
        },
      ),
    );
  }
}
