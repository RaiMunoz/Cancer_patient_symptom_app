import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'activity_entry.dart';

class ContactServiceActivity {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<activity_entry> createActivityEntry(activity_entry entry) async {
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
  activity_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new activity_entry();
    entry.activity_name = map['activity_name'];
    entry.start_time =
        new DateFormat.yMd().add_jm().parseStrict(map['start_time']);
    entry.duration = map['duration'];
    return entry;
  }

  // For sending to database
  String _toJson(activity_entry entry) {
    var data = new Map();
    data['activity_name'] = entry.activity_name;
    data['start_time'] = new DateFormat.yMd().add_jm().format(entry.start_time);
    data['duration'] = entry.duration;
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
