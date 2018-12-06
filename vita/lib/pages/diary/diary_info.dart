import 'package:flutter/material.dart';

import 'medications/medication.dart';
import 'nutrition/nutrition_entry.dart';

List<medication> meds = [
  medication(
      name: 'Cisplatin',
      dose: '15 mg',
      started: DateTime.now(),
      stopped: null,
      current: true,
      times: [TimeOfDay(hour: 10, minute: 30), TimeOfDay(hour: 16, minute: 0)],
      notifications: true
  ),
  medication(
      name: 'Iron Supplements',
      dose: '65 mg',
      started: DateTime.now().subtract(Duration(days: 100)),
      stopped: DateTime.now().subtract(Duration(days: 18)),
      current: false,
      times: [TimeOfDay(hour: 20, minute: 0)],
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