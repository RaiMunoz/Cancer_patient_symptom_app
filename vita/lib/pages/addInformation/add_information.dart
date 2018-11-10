import 'package:flutter/material.dart';
import './../../add_diary_entry_widget.dart';
import './diary_button.dart';
import './../analytics/test_viz.dart';

class AddInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      color: Colors.teal[200],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiaryButton('Symptoms', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => AddSymptomsWidget()),
                  );
                },),

                DiaryButton('Medications', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => AddMedicationsWidget()),
                  );
                }),

                DiaryButton('Nutrition', () {}),

                DiaryButton('Activity', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => AnimatedPieChartExample()),
                  );
                }),

                DiaryButton('Sleep', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddSleepWidget()),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}