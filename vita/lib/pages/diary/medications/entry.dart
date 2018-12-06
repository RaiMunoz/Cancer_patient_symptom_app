import 'package:intl/intl.dart';

class medentrysubmit {
  String medication_name;
  String dosage;
  DateTime time_taken;
  medentrysubmit(this.medication_name,this.dosage,this.time_taken);


  toJson()
  {
    String timer= DateFormat('yyyy-MM-dd – kk:mm').format(time_taken);
    return {
      "medication_name": medication_name,
      "dosage": dosage,
      //"time": new DateFormat.yMd().add_jm().format(time),
      "time_taken": timer,
    };
  }
}

