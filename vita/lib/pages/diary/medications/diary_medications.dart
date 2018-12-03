import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'medication_button.dart';
import '../../../assets/constants/medications.dart';

class diary_medications extends StatefulWidget {
  diary_medications();

  @override
  _diary_medications createState() => new _diary_medications();
}

class _diary_medications extends State<diary_medications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.darkGreen,
        title: Text('Track My Medications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder:
            (context, int i) {
          return medication_button(title: medications[i]);
        },
        itemCount: medications.length,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
    );
  }
}
