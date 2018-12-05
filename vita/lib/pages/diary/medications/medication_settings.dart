import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../../assets/theme/theme.dart';

import 'medication_entry.dart';
import 'medication_time.dart';
import 'medication.dart';
import 'contact_service_medication.dart';
import 'select_dose_time.dart';
import '../entry_button_generic.dart';

class medication_settings extends StatefulWidget {
  final medication med;

  medication_settings(this.med);

  @override
  _medication_settings createState() => new _medication_settings();
}

class _medication_settings extends State<medication_settings> {
  bool current = true;
  bool notifications = true;
  String dose = '';

  @override
  Widget build(BuildContext context) {
    if(widget.med.current != null) current = widget.med.current;
    else widget.med.current = true;

    if(widget.med.dose != null && widget.med.dose.length > 0) dose = widget.med.dose;

    List<Widget> time_children = [];
    for(int i = 0;i < widget.med.times.length; i++ ) {
      time_children.add(
        Row(
          children: [
            medication_time(widget.med, i),
            IconButton(
              icon: Icon(Icons.cancel, color: ThemeColors.darkGreen),
              onPressed: () {
                setState((){
                  widget.med.times.removeAt(i);
                });
              },
            ),
          ]
        )
      );
    }
    time_children.add(
      IconButton(
        icon: Icon(Icons.add_circle, color: ThemeColors.darkGreen),
        onPressed: () {
          setState((){
            widget.med.times.add(TimeOfDay.now());
          });
        },
      )
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: <Widget>[
          Row(
            children: [
              entry_title('Currently Taking'),
              Switch(
                value: current,
                onChanged: (val) {
                  setState(() {
                    current = !current;
                  });
                  widget.med.current = current;
                },
              )
            ],
          ),
          Row(
            children: [
              entry_title('Default Dose'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              Expanded(
                child: TextFormField(
                  initialValue: dose,
                  onFieldSubmitted: (val) {widget.med.dose = val;},
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Default Dose',),
                ),
              ),
            ],
          ),
          Row(
            children: [
              entry_title('Notifications'),
              Switch(
                value: notifications,
                onChanged: (val) {
                  setState((){
                    notifications = !notifications;
                  });
                  widget.med.notifications = notifications;
                },
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Row(
            children: [
              entry_title('Medication Times'),
              Column(
                children: time_children,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      )
    );
  }
}