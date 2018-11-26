import 'package:flutter/material.dart';

import 'symptom_button.dart';
import 'symptom_other_button.dart';
import '../../../assets/constants/symptoms.dart';
import '../../../assets/theme/theme.dart';

class diary_symptoms extends StatefulWidget {
  diary_symptoms();

  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  List<Widget> scroll_children = <Widget>[];


  @override
  Widget build(BuildContext context) {
    if(scroll_children.length == 0) {
      for(int i = 0; i < symptoms.length; i++) {
        scroll_children.add(symptom_button(title: symptoms[i]));
      }

      scroll_children.add(
        IconButton(
          icon: Icon(Icons.add_circle),
          iconSize: MediaQuery.of(context).size.width * 0.1,
          color: ThemeColors.darkGreen,
          padding: EdgeInsets.only(top: 5.0),
          onPressed: () {
            setState(() {
              scroll_children.insert(scroll_children.length - 1, symptom_other_button());
            });
          },
        )
      );
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text('Track My Symptoms'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        itemBuilder: (context, i) => scroll_children[i],
        itemCount: scroll_children.length,
      ),
    );
  }
}
