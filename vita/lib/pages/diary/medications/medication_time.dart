import 'package:flutter/material.dart';
import 'medication.dart';
import '../entry_button_generic.dart';

class medication_time extends StatefulWidget {
  final medication med;
  final int index;
  medication_time(this.med, this.index);

  @override
  _medication_time createState() => new _medication_time();
}

class _medication_time extends State<medication_time> {
  TimeOfDay time;

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: time,
    );

    if(picked != null && picked != time) {
      setState((){
        time = picked;
      });
      widget.med.times[widget.index] = time;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.med.times[widget.index] == null) {
      widget.med.times[widget.index] = TimeOfDay.now();
    }
    time = widget.med.times[widget.index];

    return FlatButton(
      child: entry_title("${time.format(context)}"),
      onPressed: () {selectTime(context);}
    );
  }
}
