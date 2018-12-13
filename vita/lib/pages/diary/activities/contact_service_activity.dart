
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:intl/intl.dart';

import 'activity_entry.dart';
import 'entry.dart';

import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class  ContactServiceActivity  {
  ContactServiceActivity (this.auth,this.time_submit) : super();
  final loginAuthImplement auth;
  final DateTime time_submit;


  Future<String> submit_entry(activity_entry entry) async
  {

    try {
      activityentrysubmit entry2= activityentrysubmit(entry.activity_name,entry.start_time,entry.duration);

      String userid= await auth.getCurrentUser();
      //String submit= '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time);
      //String submit= '\nTime: ' + DateFormat.jms().format(entry.time);
      final mref= FirebaseDatabase.instance.reference();
      // Need to down the list here!
      final muser= mref.child("users");
      final dentry = muser.child(userid);
      final sentry= dentry.child("activity");
      final cer_entry= sentry.child("activity_"+entry.activity_name);
      String timer= DateFormat('yyyy-MM-dd – kk:mm').format(entry.start_time);

      DatabaseReference ref= cer_entry.child("entry_"+timer);

      ref.set(entry2.toJson());
      print('Created entry: \nMedication name: ' + entry.activity_name +
          '\nTime Started: ' + timer +
          '\nTime Duration: ' + entry.duration);

      return "Data Packet Sent!";
    }
    catch (e) {
      print('Server Exception!!!');
      print(e);
      return 'Server Exception!!!';
    }
  }

}

