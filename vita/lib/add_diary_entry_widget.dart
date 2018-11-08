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
    return Container(
      margin: const EdgeInsets.all(60.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Symptom Log',
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            ),
            Text('What symptoms have you experienced today?'),
            TextEntry('Symptom', 60.0),
            TextEntry('Symptom', 40.0),
            TextEntry('Symptom', 40.0),
            TextEntry('Symptom', 40.0),
          ],
        ),
      ),
    );
  }
}

class AddMedicationsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(60.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Medication Log',
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            ),
            Text('What medications have you taken today?'),
            TextEntry('Medication', 60.0),
            TextEntry('Medication', 40.0),
            TextEntry('Medication', 40.0),
            TextEntry('Medication', 40.0),
          ],
        ),
      ),
    );
  }
}

class AddSleepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(60.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'Sleep Log',
              style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            ),
            Text(
              'How much did you sleep last night?'
            ),
            TextEntry('hours', 60.0),
          ],
        ),
      ),
    );
  }
}