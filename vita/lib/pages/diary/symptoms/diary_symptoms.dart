import 'package:flutter/material.dart';

import 'symptom_button.dart';
import '../../../assets/constants/symptoms.dart';

class diary_symptoms extends StatefulWidget {
  diary_symptoms();

  @override
  _diary_symptoms createState() => new _diary_symptoms();
}

class _diary_symptoms extends State<diary_symptoms> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, int i)
        {return symptom_button(title: symptoms[i]);},
        itemCount: symptoms.length,
      ),
      /*body: ListView(
        children: <Widget>[
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
          new symptom_button(
            title: 'hi',
          ),
        ],
      ),*/
    );
  }
}
