import 'package:flutter/material.dart';
import 'package:vita/assets/theme/theme.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';

//import 'package:vita/placeholder_widget.dart';

// Inspired from https://github.com/tomialagbe/flutter_ui_challenges
class _notifSettings extends State<notifSettings> {
  final titleTextStyle = new TextStyle(
      color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600);

  final textboxTextStyle = new TextStyle(
      color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600);

  bool recordSymptomsSwitchValue = false;
  TimeOfDay recordSymptomsTime = TimeOfDay(hour:14, minute:15);

  Future<Null> recordSymptomsSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: recordSymptomsTime
    );

    if(picked != null && picked!=recordSymptomsTime) {
      setState((){
        recordSymptomsTime = picked;
      });
    }
  }

  bool recordWeightSwitchValue = false;
  TimeOfDay recordWeightTime = TimeOfDay(hour:14, minute:15);

  Future<Null> recordWeightSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: recordWeightTime
    );

    if(picked != null && picked!=recordWeightTime) {
      setState((){
        recordWeightTime = picked;
      });
    }
  }

  bool recordDietSwitchValue = false;
  TimeOfDay recordDietTime = TimeOfDay(hour:14, minute:15);

  Future<Null> recordDietSelectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: recordDietTime
    );

    if(picked != null && picked!=recordDietTime) {
      setState((){
        recordDietTime = picked;
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