import 'package:intl/intl.dart';

class activityentrysubmit {
  String activity_name;
  DateTime start_time;
  String duration;
  activityentrysubmit(this.activity_name,this.start_time,this.duration);


  toJson()
  {
    String timer= DateFormat('yyyy-MM-dd – kk:mm').format(this.start_time);
    return {
      "activity_name": activity_name,
      "start_time": timer,
      //"time": new DateFormat.yMd().add_jm().format(time),
      "duration": duration,
    };
  }
}

