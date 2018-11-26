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
        style: TextStyle(color: ThemeColors.white),
      ),
      color: ThemeColors.darkGreen,
      shape: CircleBorder(),
      onPressed: () {entry.severity = rating;},
    );
  }
}

class select_severity extends StatefulWidget {
  final symptom_entry entry;

  const select_severity({Key key, this.entry}): super(key: key);

  @override
  _select_severity createState() => new _select_severity();
}

class _select_severity extends State<select_severity> {
  int severity = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: severity.toDouble(),
          label: '$severity',
          min: 1.0,
          max: 10.0,
          divisions: 10,
          onChanged: (val) {
            widget.entry.severity = val.round();
            setState(() {
              severity = val.round();
            });
          },
        ),
      ],
    );
  }
}
