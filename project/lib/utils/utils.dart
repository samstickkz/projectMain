import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin Utils {
  static bool isLightMode(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.light;
  }

  static String toDateTime(DateTime dateTime){
    final date =DateFormat.yMMMEd().format(dateTime);
    final time =DateFormat.Hm().format(dateTime);

    return'$date $time';
  }
  static String toDate(DateTime dateTime){
    final date =DateFormat.yMMMEd().format(dateTime);

    return date;
  }
  static String toTime(DateTime dateTime){
    final time =DateFormat.Hm().format(dateTime);

    return time;
  }
  static DateTime removeTime(DateTime dateTime)=>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

}