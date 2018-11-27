import 'package:flutter/material.dart';

import '../../../assets/theme/theme.dart';
import '../../../assets/theme/theme_slider.dart';
import 'symptom_entry.dart';

class select_severity extends StatefulWidget {
  final symptom_entry entry;

  const select_severity({Key key, this.entry}): super(key: key);

  @override
  _select_severity createState() => new _select_severity();
}

class _select_severity extends State<select_severity> {
  List<int> severity_list = List<int>.generate(5, (val) => val + 1);
  int severity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        children: <Widget>[
          ThemeSlider(
            Slider(
              value: severity.toDouble(),
              label: '$severity',
              min: 1.0,
              max: 5.0,
              divisions: 4,
              onChanged: (val) {
                widget.entry.severity = val.round();
                setState(() {
                  severity = val.round();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(severity_list.length, (i) => Text((i+1).toString()))
          ),
        ],
      ),
    );
  }
}
