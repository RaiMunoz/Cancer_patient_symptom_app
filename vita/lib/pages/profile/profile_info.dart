class Profile {
  String firstName;
  String lastName;
  String location;
  int total_steps;
  int heart_rate;
  int hours_slept;

  String get fullName => "$firstName $lastName";

  String get TotalStepsString => _abbreviatedCount(total_steps);

  String get HeartRateString => _abbreviatedCount(heart_rate);

  String get HoursSleptString => _abbreviatedCount(hours_slept);

  String _abbreviatedCount(int num) {
    if (num < 1000) return "$num";
    if (num >= 1000 && num < 1000000) {
      String s = (num / 1000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}K";
    } else if (num >= 1000000 && num < 1000000000) {
      String s = (num / 1000000).toStringAsFixed(1);
      if (s.endsWith(".0")) {
        int idx = s.indexOf(".0");
        s = s.substring(0, idx);
      }
      return "${s}M";
    }
    return "";
  }
}

Profile getProfile() {
  return new Profile()
    ..firstName = "Rai"
    ..lastName = "Munoz"
    ..location = "New York"
    ..total_steps = 5670
    ..heart_rate = 90
    ..hours_slept = 6;
}