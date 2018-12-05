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