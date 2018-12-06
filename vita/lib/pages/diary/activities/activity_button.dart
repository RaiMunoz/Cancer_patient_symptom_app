
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'activity_entry.dart';
import 'contact_service_activity.dart';
import 'select_duration.dart';
import '../entry_button_generic.dart';
import 'package:vita/pages/login/login_auth.dart';

class activity_button extends StatefulWidget {
  final String title;
  final bool custom;
  final activity_entry entry = new activity_entry();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final loginAuthImplement auth;

  activity_button({Key key,this.title, this.custom,this.auth}): super(key: key);

  void submitForm() {
    final FormState form = formKey.currentState;
    form.save();

    if(!custom) entry.activity_name = title;
    DateTime time_submit = DateTime.now();

    if(entry.start_time != null && entry.duration != null) {
      var contactService = new ContactServiceActivity(auth,time_submit);
      var db_return=contactService.submit_entry(entry);
      print('Submitted ' + entry.activity_name);
    }
  }

  @override
  _activity_button createState() => new _activity_button();
}

class _activity_button extends State<activity_button> {
  @override
  Widget build(BuildContext) {
    var width = MediaQuery.of(context).size.width;
    Widget title_widget;
    if(widget.custom) {
      title_widget = Row(
        children: <Widget>[
          entry_title('New Activity:'),
          Padding(padding: EdgeInsets.only(left: width / 20)),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (val) {widget.entry.activity_name = val;},
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'Activity Name',),
            ),
          ),
        ],
      );
    }
    else title_widget = entry_title(widget.title);

    return Form(
      key: widget.formKey,
      child: entry_button_generic(
        title: title_widget,
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
