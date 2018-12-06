import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'nutrition_entry.dart';
import 'contact_service_nutrition.dart';
import 'meal_eaten.dart';
import '../entry_button_generic.dart';

class nutrition_button extends StatefulWidget {
  final entry = new nutrition_entry();
  final bool custom;

  nutrition_button({this.custom});

  void submitForm() {
    if(entry.food != null && entry.food.length != '') {
      var contactService = new ContactServiceNutrition();
      contactService.createNutritionEntry(this.entry);
      print('Submitted ' + this.entry.food);
    }
  }

  @override
  _nutrition_button createState() => new _nutrition_button();
}

class _nutrition_button extends State<nutrition_button> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget title_widget = Row(
        children: <Widget>[
          entry_title('New Meal'),
          Padding(padding: EdgeInsets.only(left: width / 20)),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (val) {widget.entry.food = val;},
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'What did you eat?',),
            ),
          ),
        ],
      );

    return entry_button_generic(
      title: title_widget,
      children: <Widget>[
        FittedBox(
          child: meal_eaten(
            widget.entry,
          ),
        ),
      ],
      action: (val){},
    );
  }
}
