import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'symptom_entry.dart';

class ContactServiceSymptom {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<symptom_entry> createSymptomEntry(symptom_entry entry) async {
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
  symptom_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new symptom_entry();
    entry.symptom_name = map['symptom_name'];
    entry.severity = map['severity'];
    entry.time = new DateFormat.yMd().add_jm().parseStrict(map['time']);
    return entry;
  }

  // For sending symptom to database
  String _toJson(symptom_entry entry) {
    var data = new Map();
    data['symptom_name'] = entry.symptom_name;
    data['severity'] = entry.severity;
    data['time'] = new DateFormat.yMd().add_jm().format(entry.time);
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
