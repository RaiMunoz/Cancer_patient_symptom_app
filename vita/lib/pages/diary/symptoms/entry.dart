import 'package:intl/intl.dart';

class entry_submit {
  String symptom_name;
  int severity;
  //DateTime time;
  bool custom = false;

  entry_submit(this.symptom_name,this.severity,this.custom);

  toJson()
  {
    return {
      "symptom_name": symptom_name,
      "severity": severity.toString(),
      //"time": new DateFormat.yMd().add_jm().format(time),
      "custom": custom.toString(),
    };
  }
}