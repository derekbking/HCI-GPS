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
      child: Column(
        children: <Widget>[
          RichText(
            text: TextSpan(
                text: hour.toString() +
                    ":" +
                    minute.toString() +
                    " " +
                    amPm +
                    "  ",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 28),
                ),
                children: [
                  TextSpan(
                    text: getDate(),
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  var dayMap = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };

  var monthMap = {
    1: "Janurary",
    2: "Feburary",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "Septemeber",
    10: "October",
    11: "November",
    12: "December",
  };

  String getDate() {
    return dayMap[_dateTime.weekday] +
        ", " +
        monthMap[_dateTime.month] +
        " " +
        _dateTime.day.toString();
  }
}
