import 'package:flutter/material.dart';

import 'medication_button.dart';
import 'medication.dart';
import '../../../assets/constants/medications.dart';

class diary_medications extends StatefulWidget {
  diary_medications();

  @override
  _diary_medications createState() => new _diary_medications();
}

class _diary_medications extends State<diary_medications> {
  @override
  Widget build(BuildContext context) {
    List<medication> meds = [
      medication(
          name: 'hi',
          dose: '15mg',
          started: DateTime.now(),
          stopped: null,
          current: true,
          frequency: 0,
          times: [],
          notifications: false
      ),
    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text('My Medications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder:
            (context, int i) {
          return medication_button(title: meds[i].name, med: meds[i]);
        },
        itemCount: meds.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
