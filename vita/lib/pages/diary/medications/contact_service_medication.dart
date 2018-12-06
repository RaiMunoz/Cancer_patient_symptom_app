import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'medication_entry.dart';
import 'entry.dart';

import 'package:vita/pages/login/login_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ContactServiceMedication {
  ContactServiceMedication(this.auth,this.time_submit) : super();
  final loginAuthImplement auth;
  final DateTime time_submit;


  Future<String> submit_entry(medication_entry entry) async
  {

    try {
      medentrysubmit entry2= medentrysubmit(entry.medication_name,entry.dosage,entry.time_taken);

      String userid= await auth.getCurrentUser();
      //String submit= '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time);
      //String submit= '\nTime: ' + DateFormat.jms().format(entry.time);
      final mref= FirebaseDatabase.instance.reference();
      // Need to down the list here!
      final muser= mref.child("users");
      final dentry = muser.child(userid);
      final sentry= dentry.child("medication");
      final cer_entry= sentry.child("medication_"+entry.medication_name);
      String timer= DateFormat('yyyy-MM-dd – kk:mm').format(time_submit);

      DatabaseReference ref= cer_entry.child("entry_"+timer);

      ref.set(entry2.toJson());
      print('Created entry: \nMedication name: ' + entry.medication_name +
          '\nDosage: ' + entry.dosage +
          '\nTime taken: ' + DateFormat.yMd().add_jm().format(entry.time_taken));

      return "Data Packet Sent!";
    }
    catch (e) {
      print('Server Exception!!!');
      print(e);
      return 'Server Exception!!!';
    }
  }

}

/*import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'medication_entry.dart';

class ContactServiceMedication {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<medication_entry> createMedicationEntry(medication_entry entry) async {
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

  // For getting symptom from database
  medication_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new medication_entry();
    entry.medication_name = map['medication_name'];
    entry.dosage= map['dosage'];
    entry.time_taken = new DateFormat.yMd().add_jm().parseStrict(map['time_taken']);
    return entry;
  }

  // For sending symptom to database
  String _toJson(medication_entry entry) {
    var data = new Map();
    data['medication_name'] = entry.medication_name;
    data['dosage'] = entry.dosage;
    data['time_taken'] = new DateFormat.yMd().add_jm().format(entry.time_taken);
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
*/
