import 'package:flutter/material.dart';

class medication {
  String name;
  String dose = '';
  DateTime started = DateTime.now();
  DateTime stopped = null;
  bool current = true;
  List<TimeOfDay> times = [];
  bool notifications = true;

  medication({this.name, this.dose, this.started, this.stopped, this.current, this.times, this.notifications});
}




