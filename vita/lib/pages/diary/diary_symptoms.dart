import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';


// Inspired from https://codingwithjoe.com/building-forms-with-flutter/
class diary_symptoms extends StatefulWidget {
  diary_symptoms();

  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  List<int> severity_list = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int severity = null;
  symptom_entry entry = new symptom_entry();

 void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.time = DateTime.now();
    var contactService = new ContactServiceSymptom();
    contactService.createSymptomEntry(entry);
    print('Created entry: \nSymptom name: ' + entry.symptom_name +
        '\nSeverity: ' + entry.severity.toString() +
        '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body:
      new Form(
        key: formKey,
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.content_paste),
                    hintText: 'What symptom are you experiencing?',
                  ),
                  onSaved: (val) => entry.symptom_name = val,
                ),
                new DropdownButton<int>(
                  value: severity,
                  items: severity_list.map((int value) {
                    return new DropdownMenuItem<int>(
                      value: value,
                      child: new Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      entry.severity = val;
                      severity = val;
                    });
                  }
                ),
                new Container(
                  padding: EdgeInsets.only(left: 40.0, top: 20.0),
                  child: new RaisedButton(
                    child: const Text('Submit'),
                    onPressed: submitForm,
                  )
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
