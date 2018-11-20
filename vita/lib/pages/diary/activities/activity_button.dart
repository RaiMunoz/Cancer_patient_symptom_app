
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

  const activity_button({Key key, this.title}): super(key: key);

  @override
  _activity_button createState() => new _activity_button();
}

class _activity_button extends State<activity_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  activity_entry entry = new activity_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.activity_name = widget.title;
    if(entry.start_time != null && entry.duration != null) {
      var contactService = new ContactServiceActivity();
      contactService.createActivityEntry(entry);
      print('Created entry: \nActivity name: ' + entry.activity_name +
          '\nStart time: ' + DateFormat.yMd().add_jm().format(entry.start_time) +
          '\nDuration: ' + entry.duration);
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
            child: select_duration(entry),
          ),
        ],
        action: (expanded) {
          if(!expanded) submitForm();
        },
      ),
    );
  }
}
