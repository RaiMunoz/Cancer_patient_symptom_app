import 'package:flutter/material.dart';

import '../../../assets/theme/theme.dart';
import 'symptom_entry.dart';

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
      shape: CircleBorder(),
      onPressed: () {entry.severity = rating;},
    );
  }
}

class select_severity extends StatelessWidget {
  final symptom_entry entry;
  select_severity(this.entry);

  @override
  Widget build(BuildContext context) {
    return Row(
    children: <Widget>[
    symptom_rating_button(1, entry),
    symptom_rating_button(1, entry),
    symptom_rating_button(1, entry),
    symptom_rating_button(2, entry),
    symptom_rating_button(2, entry),
    ],
    );
  }
}
