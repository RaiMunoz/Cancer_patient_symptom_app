import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'diary_entry.dart';
import 'contact_service.dart';


// Inspired from https://codingwithjoe.com/building-forms-with-flutter/
class diary_symptoms extends StatefulWidget {
  diary_symptoms();

  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<int> _severities = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int _severity = null;

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(),
        body: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.content_paste),
                        hintText: 'What symptom are you experiencing?',
                        labelText: 'Symptom',
                      ),
                    ),
                    new Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: new RaisedButton(
                          child: const Text('Submit'),
                          onPressed: () {},
                        )),
                  ],
                ),
      );
    }
  }
