import 'package:flutter/material.dart';

class TextEntry extends StatelessWidget {
  final String  initialText;
  final double topPadding;

  TextEntry(this.initialText, this.topPadding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: topPadding),
      child: TextFormField(
        initialValue: initialText,
      )
    );
  }
}

class AddSymptomsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              children: [
                Text(
                    'Symptom Log',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 40.0),
                  child: Text('What symptoms are you experiencing today?'),
                ),
                TextEntry('Symptom', 60.0),
                TextEntry('Symptom', 40.0),
                TextEntry('Symptom', 40.0),
                TextEntry('Symptom', 40.0),
              ],
            ),
          ),
        )
    );
  }
}

class AddMedicationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(60.0),
        child: Center(
          child: Column(
            children: [
              Text(
                  'Medication Log',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 40.0),
                child: Text('What medications have you taken today?'),
              ),
              TextEntry('Medication', 60.0),
              TextEntry('Medication', 40.0),
              TextEntry('Medication', 40.0),
              TextEntry('Medication', 40.0),
            ],
          ),
        ),
      )
    );
  }
}

class AddSleepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 100.0, vertical: 150.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Sleep Log',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 40.0),
                  child: Text('How much did you sleep last night?'),
                ),
                TextEntry('hours', 60.0),
              ],
            ),
          ),
        )
    );
  }
}