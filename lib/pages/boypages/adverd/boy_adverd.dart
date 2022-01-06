import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:host_manager/domein/meeting.dart';
import 'package:host_manager/sidemanu/boy_sidemanu.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BoyAdverd extends StatefulWidget {
  static const String routesName = "/boyadverd";

  const BoyAdverd({Key? key}) : super(key: key);

  @override
  _BoyAdverdState createState() => _BoyAdverdState();
}

class _BoyAdverdState extends State<BoyAdverd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ボーイヘッダー
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const SafeArea(
          child: SizedBox(
            height: 100,
            child: Text(
              "出勤管理",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      drawer: const BoySideMenu(),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          dataSource: _getCalendarDataSource(),
          monthViewSettings: const MonthViewSettings(
            showTrailingAndLeadingDates: false,
            showAgenda: true,
            agendaViewHeight: 200,
          ),
        ),
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(
    Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(minutes: 10)),
      subject: 'まりちゃん',
      color: Colors.pink,
      isAllDay: true,
    ),
  );
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  String getStartTimeZone(int index) {
    return appointments![index].startTimeZone;
  }

  @override
  String getEndTimeZone(int index) {
    return appointments![index].endTimeZone;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}
