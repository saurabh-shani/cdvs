import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatting extends StatelessWidget {
  final String date;

  DateFormatting(this.date);

  @override
  Widget build(BuildContext context) {
    var tempDate = new DateFormat('dd-MM-yyyy').format(DateTime.parse(date));

    return Text(tempDate.toString());
  }
}

class TimeFormatting extends StatelessWidget {
  final String timefromApi;

  TimeFormatting({Key? key, required this.timefromApi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime tempDate = DateFormat("hh:mm").parse(timefromApi);

    var dateFormat = DateFormat("h:mm a"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    return Text(utcDate);
  }
}
