class medication {
  final String name;
  final String dose;
  final DateTime started;
  final DateTime stopped;
  final bool current;
  final int frequency;
  final List<DateTime> times;
  final bool notifications;

  medication({this.name, this.dose, this.started, this.stopped, this.current, this.frequency, this.times, this.notifications});
}