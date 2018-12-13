import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'symptom_entry.dart';
import 'select_severity.dart';
import '../entry_button_generic.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'entry.dart';


class symptom_other_button extends StatefulWidget {
  const symptom_other_button({Key key, this.auth}): super(key: key);

  final loginAuthImplement auth;

  @override
  _symptom_other_button createState() => new _symptom_other_button();
}

class _symptom_other_button extends State<symptom_other_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = null;
  symptom_entry entry = new symptom_entry();

  void submitForm() async {
    final FormState form = formKey.currentState;

    form.save();
    entry.time = DateTime.now();
    entry.custom = true;
    if(entry.symptom_name != null && entry.severity != null) { // no severity was selected
      entry_submit entry2= entry_submit(entry.symptom_name,entry.severity,entry.custom);

      String userid= await widget.auth.getCurrentUser();
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
      //var contactService = new ContactServiceSymptom(widget.auth);
      //contactService.createSymptomEntry(entry);
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
