import 'package:flutter/material.dart';

import '../../../assets/theme/theme.dart';

class symptom_button extends StatefulWidget {
  final String title;
  final int severity;

  const symptom_button({Key key, this.title, this.severity}): super(key: key);

  @override
  _symptom_button createState() => new _symptom_button();
}

class symptom_rating_button extends StatelessWidget {
  final int rating;
  symptom_rating_button(this.rating);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: Text(
        rating.toString(),
        style: TextStyle(color: Colors.white),
      ),
      //shape: CircleBorder(side: BorderSide(),),
      color: ThemeColors.darkGreen,
      onPressed: () {},
    );
  }
}

class _symptom_button extends State<symptom_button> {
  @override
  Widget build(BuildContext) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ExpansionTile(
        title: Text(widget.title),
        children: <Widget>[
          symptom_rating_button(1),
          symptom_rating_button(1),
          symptom_rating_button(1),
          symptom_rating_button(2),
          symptom_rating_button(2),
        ],
      ),
    );
  }
}
