import 'package:flutter/material.dart';
import './diary_button.dart';
import 'symptoms/diary_symptoms.dart';
import 'medications/diary_medications.dart';
import 'activities/diary_activities.dart';
import 'sleep/diary_sleep.dart';
import 'nutrition/diary_nutrition.dart';
import '../../assets/theme/theme.dart';
import 'package:vita/pages/login/login_auth.dart';

class AddInformation extends StatelessWidget {

  AddInformation({Key key, this.auth}): super(key:key);

  final loginAuthImplement auth;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      color: ThemeColors.grey1,
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
                      builder: (context) => diary_symptoms(auth: auth)),
                  );
                },),

                DiaryButton('Medications', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => diary_medications(auth: auth)),
                  );
                }),

                DiaryButton('Nutrition', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => diary_nutrition(auth:auth)),
                  );
                }),


                DiaryButton('Activity', () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => diary_activities(auth:auth)),
                  );
                }),

                DiaryButton('Sleep', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => diary_sleep(auth:auth)),
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