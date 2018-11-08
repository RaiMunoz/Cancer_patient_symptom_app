import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'diary_entry.dart';

class ContactService {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<diary_entry> createDiaryentry(diary_entry entry) async {
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

  diary_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new diary_entry();
    entry.entry_title= map['entry_title'];
    entry.dob = new DateFormat.yMd().parseStrict(map['dob']);
    entry.medication = map['medication'];
    entry.feedback = map['symptom'];
    entry.symptom = map['feedback'];
    entry.rating= map['rating'];
    return entry;
  }

  String _toJson(diary_entry entry) {
    var mapData = new Map();
    mapData["entry_title"] = entry.entry_title;
    mapData["dob"] = new DateFormat.yMd().format(entry.dob);
    mapData["medication"] = entry.medication;
    mapData["feedback"] = entry.feedback;
    mapData["symptom"] = entry.symptom;
    mapData['rating']= entry.rating;
    String jsonContact = json.encode(mapData);
    return jsonContact;
  }
}
