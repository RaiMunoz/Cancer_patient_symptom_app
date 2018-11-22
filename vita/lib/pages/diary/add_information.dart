import 'package:flutter/material.dart';
import '../diary/add_diary_entry_widget.dart';
import './diary_button.dart';
import 'symptoms/diary_symptoms.dart';
import 'medications/diary_medications.dart';
import 'activities/diary_activities.dart';
import 'sleep/diary_sleep.dart';


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
                      builder: (context) => diary_symptoms()),
                  );
                },),

                DiaryButton('Medications', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => diary_medications()),
                  );
                }),

                DiaryButton('Nutrition', () {}),


                DiaryButton('Activity', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => diary_activities()),
                  );
                }),

                DiaryButton('Sleep', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => diary_sleep()),
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