import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'symptom_entry.dart';
import 'entry.dart';

import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class ContactServiceSymptom {
  ContactServiceSymptom(this.auth) : super();
  final loginAuthImplement auth;


  Future<String> submit_entry(symptom_entry entry) async
  {

    try {
      entry_submit entry2= entry_submit(entry.symptom_name,entry.severity,entry.custom);
      String userid= await auth.getCurrentUser();
      //String submit= '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time);
      //String submit= '\nTime: ' + DateFormat.jms().format(entry.time);
      final mref= FirebaseDatabase.instance.reference();
      // Need to down the list here!
      final muser= mref.child("users");
      final dentry = muser.child(userid);
      final sentry= dentry.child("symptoms");
      final cer_entry= sentry.child("symptom_"+entry.symptom_name);
      String timer= DateFormat('yyyy-MM-dd – kk:mm').format(entry.time);

      DatabaseReference ref= cer_entry.child("entry_"+timer);

      ref.set(entry2.toJson());
      print('Created entry: \nSymptom name: ' + entry.symptom_name +
          '\nSeverity: ' + entry.severity.toString() +
          '\nTime: ' + timer +
          '\nCustom: ' + entry.custom.toString());

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
class ContactServiceSymptom {
  ContactServiceSymptom(this.auth): super();

  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  final loginAuthImplement auth;

  Future<symptom_entry> createSymptomEntry(symptom_entry entry) async {
    try {
      var json = _toJson(entry);

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

      print(json);
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
    Map<String, String> map = json.decode(jsonContact);
    var entry = new symptom_entry();
    entry.symptom_name = map['symptom_name'];
    //entry.severity = map['severity'];
    //entry.custom = map['custom'];
    //entry.time = new DateFormat.yMd().add_jm().parseStrict(map['time']);
    return entry;
  }

  // For sending symptom to database

  String _toJson(symptom_entry entry3) {
    //String date=new DateFormat.yMd().add_jm().format(entry3.time);
    print("_toJson is Running!");
    print(entry3.symptom_name);
    String timer= DateFormat('yyyy-MM-dd – kk:mm').format(entry3.time);

    var entry2= new entry_submit(entry3.symptom_name,entry3.severity,entry3.custom);
    /*var data = new Map();
    data['symptom_name'] = entry.symptom_name;
    data['severity'] = entry.severity;
    data['custom'] = entry.custom;
    data['time'] = new DateFormat.yMd().add_jm().format(entry.time);
    String jsonContact = json.encode(data);
    */
    return entry2.toJson();
  }
}
*/