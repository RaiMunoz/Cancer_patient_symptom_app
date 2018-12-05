class symptom_entry {
  String symptom_name;
  int severity;
  DateTime time;
  bool custom = false;

  symptom_entry(this.symptom_name,this.severity,this.time,this.custom);
}

class changedata extends symptom_entry
{
  //symptom_entry entry;
  var sensor_reading;
  changedata(String symptom_name, int severity,DateTime time, bool custom,
      this.sensor_reading): super(symptom_name,severity,time,custom);

}

class permadata extends changedata {
  String name;
  String email;
  String location;
  String weight;
  var medications;

  permadata(String symptom_name, int severity, DateTime time, bool custom,
      var sensor_reading, this.name, this.email, this.location, this.weight,
      this.medications)
      : super(symptom_name, severity, time, custom, sensor_reading);

  toJson() {
    return {
      "email": email,
      "name": name,
      "location": name,
      "weight": weight,
    };
  }
}


class overalldata extends permadata {

  overalldata(String symptom_name, int severity,DateTime time, bool custom,
      var sensor_reading, String name, String email, String location, String weight,
      var medications): super(symptom_name,severity,time,custom,sensor_reading,
      name,email,location,weight,medications);

  toJson() {
    return {
      "datetime": time,
      "email": email,
      "name": name,
      "location": location,
      "weight": weight,
      "symptom_name": symptom_name,
      "medications": medications,
      "custom": custom,
      "sensor_reading": sensor_reading,
      "severity":severity
    };
  }
}