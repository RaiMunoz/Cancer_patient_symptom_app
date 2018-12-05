import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'nutrition_entry.dart';

class ContactServiceNutrition {
  static const _serviceUrl = 'http://mockbin.org/echo';
  static final _headers = {'Content-Type': 'application/json'};

  Future<nutrition_entry> createNutritionEntry(nutrition_entry entry) async {
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
  nutrition_entry _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var entry = new nutrition_entry();
    entry.time_eaten = new DateFormat.yMd().add_jm().parseStrict(map['time_eaten']);
    entry.food = map['food'];
    return entry;
  }

  // For sending to database
  String _toJson(nutrition_entry entry) {
    var data = new Map();
    data['time_eaten'] = new DateFormat.yMd().add_jm().format(entry.time_eaten);
    data['food'] = entry.food;
    String jsonContact = json.encode(data);
    return jsonContact;
  }
}
