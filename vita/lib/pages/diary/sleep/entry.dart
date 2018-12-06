import 'package:intl/intl.dart';

class sleepentrysubmit {
  double hours;
  DateTime night;
  sleepentrysubmit(this.hours,this.night);


  toJson()
  {
    String timer= DateFormat('yyyy-MM-dd – kk:mm').format(night);
    return {
      "sleep_time": timer,
      "number_of_hours": hours.toString()
    };
  }
}