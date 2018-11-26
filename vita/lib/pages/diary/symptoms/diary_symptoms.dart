import 'package:flutter/material.dart';

import 'symptom_button.dart';
import 'symptom_other_button.dart';
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
      appBar: AppBar(
        title: Text('Track My Symptoms'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder:
          (context, int i) {
            if(i == symptoms.length) { // add other button at end
              return symptom_other_button();
            }
            return symptom_button(title: symptoms[i]);
          },
        itemCount: symptoms.length + 1,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
