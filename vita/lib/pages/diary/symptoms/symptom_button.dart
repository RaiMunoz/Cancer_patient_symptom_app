import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';
import 'select_severity.dart';
import '../entry_button_generic.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'entry.dart';
import 'package:firebase_database/firebase_database.dart';

class symptom_button extends StatefulWidget {
  final String title;
  final bool custom;
  var entry = new symptom_entry();

  symptom_button({Key key, this.title, this.custom,this.auth}): super(key: key);

  final loginAuthImplement auth;

  void submitForm() {
    entry.custom = this.custom;
    if(!this.custom) entry.symptom_name = this.title;
    entry.time = DateTime.now();
    if(entry.severity == null) entry.severity = 1; // unset vals get entered as minimum? idk what to do there

    var contactService = new ContactServiceSymptom(auth);
    contactService.submit_entry(entry);

    /*entry_submit entry2= entry_submit(entry.symptom_name,entry.severity,entry.custom);
    //var contactService = new ContactServiceSymptom(auth);
    //contactService.createSymptomEntry(entry);

    String userid= await auth.getCurrentUser();
    //String submit= '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time);
    //String submit= '\nTime: ' + DateFormat.jms().format(entry.time);
    final mref= FirebaseDatabase.instance.reference();
    // Need to down the list here!
    final muser= mref.child("users");
    final dentry = muser.child(userid);
    final sentry= dentry.child("symptoms");
    final cer_entry= sentry.child("symptom_"+entry.symptom_name);
    String timer= DateFormat('yyyy-MM-dd – kk:mm').format(entry.time);

    DatabaseReference ref= cer_entry.child("entry_"+timer);

    ref.set(entry2.toJson());
    //final f = new DateFormat('yyyy-MM-dd hh:mm');
    //f.format(entry.time);
    print('Created entry: \nSymptom name: ' + entry.symptom_name +
        '\nSeverity: ' + entry.severity.toString() +
        '\nTime: ' + timer +
        '\nCustom: ' + entry.custom.toString()
    );*/

  }

  @override
  _symptom_button createState() => new _symptom_button();
}

class _symptom_button extends State<symptom_button> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget title_widget;
    if(widget.custom) {
      title_widget = Row(
        children: <Widget>[
          entry_title('Other:'),
          Padding(padding: EdgeInsets.only(left: width / 20)),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (val) {widget.entry.symptom_name = val;},
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'Symptom Name',),
            ),
          ),
        ],
      );
    }
    else {
      title_widget = entry_title(widget.title);
    }

    return entry_button_generic(
      title: title_widget,
      children: <Widget>[
        FittedBox(
          child: select_severity(entry: widget.entry),
        ),
      ],
      action: (val){},
    );
  }
}
