import 'package:flutter/material.dart';

import 'medications/medication.dart';
import 'nutrition/nutrition_entry.dart';

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

List<nutrition_entry> meals = [
  nutrition_entry(
    time_eaten: DateTime.parse('2018-12-05 12:25'),
    food: 'Salad with chicken',
  ),
  nutrition_entry(
    time_eaten: DateTime.parse('2018-12-05 19:10'),
    food: 'Lentils, didn\'t eat much',
  ),
];