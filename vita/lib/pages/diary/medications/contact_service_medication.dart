import 'package:http/http.dart' as http;
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
