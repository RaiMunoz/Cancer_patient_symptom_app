//Adapted from https://github.com/tomialagbe/flutter_ui_challenges
import 'package:flutter/material.dart';

class Profile {
  String firstName;
  String lastName;
  String location;
  AssetImage image;
  double weight;
  int total_steps;
  int heart_rate;
  int hours_slept;
  bool notif_symptoms_on;
  int notif_symptoms_hour;
  int notif_symptoms_minute;
  bool notif_weight_on;
  int notif_weight_hour;
  int notif_weight_minute;
  bool notif_diet_on;
  int notif_diet_hour;
  int notif_diet_minute;

  String get fullName => "$firstName $lastName";

  String get TotalStepsString => _abbreviatedCount(total_steps);

  String get HeartRateString => _abbreviatedCount(heart_rate);

  String get HoursSleptString => _abbreviatedCount(hours_slept);

  String _abbreviatedCount(int num) {
    if (num < 1000) return "$num";
    if (num >= 1000 && num < 1000000) {
      String s = (num / 1000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}K";
    } else if (num >= 1000000 && num < 1000000000) {
      String s = (num / 1000000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}M";
    }
    return "";
  }
}

//TODO: Should be replaced with database stuff once it is connected
Profile getProfile() {
  return new Profile()
    ..firstName = "Rai"
    ..lastName = "Munoz"
    ..location = "New York"
    ..image = AssetImage("assets/images/rai_ted.jpg")
    ..weight = 123.45
    ..total_steps = 5670
    ..heart_rate = 90
    ..hours_slept = 6
    ..notif_symptoms_on = true
    ..notif_symptoms_hour = 14
    ..notif_symptoms_minute = 15
    ..notif_weight_on = false
    ..notif_weight_hour = 16
    ..notif_weight_minute = 17
    ..notif_diet_on = false
    ..notif_diet_hour = 18
    ..notif_diet_minute = 19;
}