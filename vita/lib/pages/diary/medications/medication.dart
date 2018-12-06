import 'package:flutter/material.dart';

class medication {
  String name;
  String dose;
  DateTime started;
  DateTime stopped;
  bool current;
  int frequency;
  List<TimeOfDay> times;
  bool notifications;

  medication({this.name, this.dose, this.started, this.stopped, this.current, this.frequency, this.times, this.notifications});
}

List<medication> meds = [
  medication(
      name: 'Sample Medication',
      dose: '15 mg',
      started: DateTime.now(),
      stopped: null,
      current: true,
      frequency: 0,
      times: [TimeOfDay(hour: 10, minute: 30), TimeOfDay(hour: 16, minute: 0)],
      notifications: false
  ),
];


