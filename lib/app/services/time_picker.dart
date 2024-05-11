import 'package:flutter/material.dart';

class TimePicker {
  static Future timePicker(context) async {
    TimeOfDay selectedTime = TimeOfDay.now();

    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (time != null) {
      print(time);
      return time;
    } else {
      return null;
    }
  }
}
