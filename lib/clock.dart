import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic hour = _dateTime.hour;
    dynamic minute = _dateTime.minute;
    var amPm = _dateTime.hour > 12 ||
            (_dateTime.hour == 12 && _dateTime.millisecond > 0)
        ? "PM"
        : "AM";

    if (hour > 12) {
      hour = hour - 12;
    }

    hour = hour.toString();
    minute = minute.toString();

    if (hour.toString().length == 1) {
      hour = "0" + hour.toString();
    }
    if (minute.toString().length == 1) {
      minute = "0" + minute.toString();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Text(hour.toString() + ":" + minute.toString() + " " + amPm,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.white, fontSize: 65))),
    );
  }
}
