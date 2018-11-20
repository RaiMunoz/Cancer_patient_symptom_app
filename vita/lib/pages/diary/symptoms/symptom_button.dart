import 'package:flutter/material.dart';

class symptom_button extends StatefulWidget {
  final String title;
  final int severity;

  const symptom_button({Key key, this.title, this.severity}) : super(key: key);

  @override
  _symptom_button createState() => new _symptom_button();
}

class symptom_rating_button extends StatelessWidget {
  final int rating;

  symptom_rating_button(this.rating);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: Text(
        rating.toString(),
        style: TextStyle(color: Colors.white),
      ),
      shape: CircleBorder(),
      onPressed: () {},
    );
  }
}

class _symptom_button extends State<symptom_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      child: FlatButton(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(widget.title,
                        style: TextStyle(color: Colors.white)),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              FittedBox(
                child: Visibility(
                  child: Row(
                    children: <Widget>[
                      symptom_rating_button(1),
                      symptom_rating_button(2),
                      symptom_rating_button(2),
                      symptom_rating_button(2),
                      symptom_rating_button(2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.lightGreen,
        onPressed: () {},
      ),
    );
  }
}
