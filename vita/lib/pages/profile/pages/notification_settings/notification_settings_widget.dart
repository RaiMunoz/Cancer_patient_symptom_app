import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'dart:async';
import 'package:vita/pages/profile/profile_info.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _notifSettings extends State<notifSettings> {
  final titleTextStyle = new TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

  final textboxTextStyle = new TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600);

  static Profile profile = getProfile();

  bool recordSymptomsSwitchValue = profile.notif_symptoms_on;
  TimeOfDay recordSymptomsTime = TimeOfDay(hour:profile.notif_symptoms_hour, minute:profile.notif_symptoms_minute);

  Future<Null> recordSymptomsSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: recordSymptomsTime
    );

    if(picked != null && picked!=recordSymptomsTime) {
      setState((){
        recordSymptomsTime = picked;
        profile.notif_symptoms_hour = recordSymptomsTime.hour;
        profile.notif_symptoms_minute = recordSymptomsTime.minute;
      });
    }
  }

  bool recordWeightSwitchValue = profile.notif_weight_on;
  TimeOfDay recordWeightTime = TimeOfDay(hour:profile.notif_weight_hour, minute:profile.notif_weight_minute);

  Future<Null> recordWeightSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: recordWeightTime
    );

    if(picked != null && picked!=recordWeightTime) {
      setState((){
        recordWeightTime = picked;
        profile.notif_weight_hour = recordWeightTime.hour;
        profile.notif_weight_minute = recordWeightTime.minute;
      });
    }
  }

  bool recordDietSwitchValue = profile.notif_diet_on;
  TimeOfDay recordDietTime = TimeOfDay(hour:profile.notif_diet_hour, minute:profile.notif_diet_minute);

  Future<Null> recordDietSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: recordDietTime
    );

    if(picked != null && picked!=recordDietTime) {
      setState((){
        recordDietTime = picked;
        profile.notif_diet_hour = recordDietTime.hour;
        profile.notif_diet_minute = recordDietTime.minute;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.darkGreen,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: ThemeColors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Notification Settings'),
        ),
          body: Container(
            color: ThemeColors.grey2,
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              padding: const EdgeInsets.only(left: 5.0),
              children: <Widget>[
                Text("Push Notifications", style: titleTextStyle),
                Padding(padding: new EdgeInsets.all(10.0),
                  child: Container(
                    height: 300.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration (
                        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                        color: ThemeColors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Record Symptoms", style: textboxTextStyle),
                                width: 130.0,
                              ),
                              Padding(padding: new EdgeInsets.all(10.0),
                                child: Container(
                                  width:100.0,
                                  //height: 120.0,
                                  //padding: const EdgeInsets.only(left: 10.0),
                                  decoration: new BoxDecoration (
                                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                      color: ThemeColors.grey4
                                  ),
                                  child: FlatButton(
                                    child: Text("${recordSymptomsTime.format(context)}"),
                                    onPressed: (){recordSymptomsSelectTime(context);}
                                  ),
                                ),
                              ),

                              Container(
                                height:250.0,
                                child: Switch(
                                    value: recordSymptomsSwitchValue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        recordSymptomsSwitchValue = value;
                                        profile.notif_symptoms_on = recordSymptomsSwitchValue;
                                      });
                                    },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Record Weight", style: textboxTextStyle),
                                width: 130.0,
                              ),
                              Padding(padding: new EdgeInsets.all(10.0),
                                child: Container(
                                  width:100.0,
                                  //height: 120.0,
                                  //padding: const EdgeInsets.only(left: 10.0),
                                  decoration: new BoxDecoration (
                                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                      color: ThemeColors.grey4
                                  ),
                                  child: FlatButton(
                                      child: Text("${recordWeightTime.format(context)}"),
                                      onPressed: (){recordWeightSelectTime(context);}
                                  ),
                                ),
                              ),

                              Container(
                                height:250.0,
                                child: Switch(
                                  value: recordWeightSwitchValue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      recordWeightSwitchValue = value;
                                      profile.notif_weight_on = recordWeightSwitchValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Record Diet", style: textboxTextStyle),
                                width: 130.0,
                              ),
                              Padding(padding: new EdgeInsets.all(10.0),
                                child: Container(
                                  width:100.0,
                                  //height: 120.0,
                                  //padding: const EdgeInsets.only(left: 10.0),
                                  decoration: new BoxDecoration (
                                      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                                      color: ThemeColors.grey4
                                  ),
                                  child: FlatButton(
                                      child: Text("${recordDietTime.format(context)}"),
                                      onPressed: (){recordDietSelectTime(context);}
                                  ),
                                ),
                              ),

                              Container(
                                height:250.0,
                                child: Switch(
                                  value: recordDietSwitchValue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      recordDietSwitchValue = value;
                                      profile.notif_diet_on = recordDietSwitchValue;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class notifSettings extends StatefulWidget {
  @override
  _notifSettings createState() => _notifSettings();
}