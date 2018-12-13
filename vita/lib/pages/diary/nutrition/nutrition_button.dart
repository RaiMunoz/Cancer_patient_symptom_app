import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'nutrition_entry.dart';
import 'contact_service_nutrition.dart';
import 'meal_eaten.dart';
import '../entry_button_generic.dart';

class nutrition_button extends StatefulWidget {
  final entry = new nutrition_entry();
  final bool custom;
  final String title;

  nutrition_button({this.title, this.custom});

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

    Widget title_widget;
    if(widget.custom) {
      title_widget = Row(
        children: <Widget>[
          entry_title('New Meal'),
          Padding(padding: EdgeInsets.only(left: width / 20)),
          Expanded(
            child: TextFormField(
              onFieldSubmitted: (val) {
                widget.entry.food = val;
              },
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(hintText: 'What did you eat?',),
            ),
          ),
        ],
      );
    }
    else title_widget = entry_title(widget.title);

    return entry_button_generic(
      title: title_widget,
      children: <Widget>[
        FittedBox(
          child: meal_eaten(
            widget.entry,
          ),
        ),
      ],
      action: (val){
        widget.entry.submit = widget.entry.food != null
                     && widget.entry.food.length > 0
                     && widget.entry.time_eaten != null;
      },
      getSubmit: () => widget.entry.submit,
    );
  }
}
