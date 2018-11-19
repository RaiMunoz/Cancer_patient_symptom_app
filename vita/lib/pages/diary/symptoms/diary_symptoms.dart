import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import 'symptom_button.dart';
import 'symptom_entry.dart';
import 'contact_service_symptom.dart';


// Inspired from https://codingwithjoe.com/building-forms-with-flutter/
class diary_symptoms extends StatefulWidget {
  diary_symptoms();

  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
        ],
      ),
    );
  }
}
