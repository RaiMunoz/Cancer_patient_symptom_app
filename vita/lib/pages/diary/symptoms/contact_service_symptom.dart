import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'symptom_entry.dart';
import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class ContactServiceSymptom {
  ContactServiceSymptom(this.auth): super();

  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  final loginAuthImplement auth;

  Future<symptom_entry> createSymptomEntry(symptom_entry entry) async {
    try {
      String json = _toJson(entry);

      // Knock knock, who's here? Let me check who?
      String userid = await auth.getCurrentUser();

      print(userid);
      // Firebase, who are you?
      final mref = FirebaseDatabase.instance.reference();

      // Oh welcome, come on in
      final muser = mref.child("users");
      final dentry= mref.child(userid);

      // Your room is on the left, go on in
      DatabaseReference ref = dentry;//dentry.child("symptom");

      // Submit is
      ref.set(json);

      // Create the needed firebase instance
      //final response =
      //await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(json);

      // Should have some kind of handshake here to ensure connection
      // was made.
      //return c;
      return c;

    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  // For getting symptom from database
  symptom_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new symptom_entry();
    entry.symptom_name = map['symptom_name'];
    entry.severity = map['severity'];
    entry.custom = map['custom'];
    entry.time = new DateFormat.yMd().add_jm().parseStrict(map['time']);
    return entry;
  }

  // For sending symptom to database
  String _toJson(symptom_entry entry) {
    var data = new Map();
    data['symptom_name'] = entry.symptom_name;
    data['severity'] = entry.severity;
    data['custom'] = entry.custom;
    data['time'] = new DateFormat.yMd().add_jm().format(entry.time);
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
