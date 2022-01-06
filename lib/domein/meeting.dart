import 'dart:ui';

class Meeting {
  Meeting(String s, DateTime startTime,
      {this.content = '',
      required this.from,
      required this.to,
      required this.background,
      this.isAllDay = false});

  String content;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
