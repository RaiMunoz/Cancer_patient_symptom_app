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
  int max_severity = 5;
  int severity = 1;

  @override
  Widget build(BuildContext context) {
    if(widget.entry.severity != null) severity = widget.entry.severity;


    return Container(
      width: 300.0,
      child: Column(
        children: <Widget>[
          ThemeSlider(
            Slider(
              value: severity.toDouble(),
              label: '$severity',
              min: 1.0,
              max: max_severity.toDouble(),
              divisions: max_severity - 1,
              onChanged: (val) {
                widget.entry.severity = val.round();
                setState(() {
                  severity = val.round();
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              max_severity,
              (int val){
                return Text(
                  (val+1).toString(),
                  style: DefaultTextStyle.of(context).style.apply(
                    color: ThemeColors.white,
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
