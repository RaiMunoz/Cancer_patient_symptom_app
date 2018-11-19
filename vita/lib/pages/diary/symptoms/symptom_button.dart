import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'symptom_entry.dart';
import 'contact_service_symptom.dart';

class symptom_button extends StatefulWidget {
  final String title;

  const symptom_button({Key key, this.title}): super(key: key);

  @override
  _symptom_button createState() => new _symptom_button();
}

class symptom_rating_button extends StatelessWidget {
  final int rating;
  final symptom_entry entry;
  symptom_rating_button(this.rating, this.entry);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: Text(
        rating.toString(),
        style: TextStyle(color: Colors.white),
      ),
      color: ThemeColors.darkGreen,
      onPressed: () {entry.severity = rating;},
    );
  }
}

class _symptom_button extends State<symptom_button> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int severity = null;
  symptom_entry entry = new symptom_entry();

  void submitForm() {
    final FormState form = formKey.currentState;

    form.save();
    entry.symptom_name = widget.title;
    entry.time = DateTime.now();
    if(entry.severity != null) { // no severity was selected
      var contactService = new ContactServiceSymptom();
      contactService.createSymptomEntry(entry);
      print('Created entry: \nSymptom name: ' + entry.symptom_name +
          '\nSeverity: ' + entry.severity.toString() +
          '\nTime: ' + DateFormat.yMd().add_jm().format(entry.time));
    }
  }

  @override
  Widget build(BuildContext) {
    return Form(
      key: formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ExpansionTile(
          title: Text(widget.title),
          children: <Widget>[
            FittedBox(
            child: Row(
              children: <Widget>[
                symptom_rating_button(1, entry),
                symptom_rating_button(1, entry),
                symptom_rating_button(1, entry),
                symptom_rating_button(2, entry),
                symptom_rating_button(2, entry),
              ],
            ),
            ),
          ],
          onExpansionChanged: (expanded) {
            if(!expanded) submitForm();
          },
        ),
      ),
    );
  }
}
