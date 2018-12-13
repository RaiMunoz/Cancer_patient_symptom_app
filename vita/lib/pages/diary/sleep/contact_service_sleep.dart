import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:intl/intl.dart';

import 'sleep_entry.dart';
import 'entry.dart';

import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactServiceSleep {
  ContactServiceSleep (this.auth,this.time_submit) : super();
  final loginAuthImplement auth;
  final DateTime time_submit;

  Future<String> submit_entry(sleep_entry entry) async
  {

    try {
      sleepentrysubmit entry2= sleepentrysubmit(entry.hours,entry.night);
      String userid= await auth.getCurrentUser();

      final mref= FirebaseDatabase.instance.reference();
      // Need to down the list here!
      final muser= mref.child("users");
      final dentry = muser.child(userid);
      final sentry= dentry.child("sleep");
      String timer= DateFormat('yyyy-MM-dd – kk:mm').format(time_submit);
      String time_slept= DateFormat('yyyy-MM-dd – kk:mm').format(entry.night);

      DatabaseReference ref= sentry.child("entry_"+timer);

      ref.set(entry2.toJson());

      print('Created entry: \nTime slept: ' + time_slept +
          '\nHours Slept: ' + entry.hours.toString());

      return "Data Packet Sent!";
    }
    catch (e) {
      print('Server Exception!!!');
      print(e);
      return 'Server Exception!!!';
    }
  }

}

/*
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'sleep_entry.dart';

class ContactServiceSleep {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<sleep_entry> createSleepEntry(sleep_entry entry) async {
    try {
      String json = _toJson(entry);
      final response =
      await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  // For getting from database
  sleep_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new sleep_entry();
    entry.hours = map['hours'];
    entry.night = new DateFormat.yMd().parseStrict(map['night']);
    return entry;
  }

  // For sending symptom to database
  String _toJson(sleep_entry entry) {
    var data = new Map();
    data['hours'] = entry.hours;
    data['night'] = new DateFormat.yMd().format(entry.night);
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
*/
