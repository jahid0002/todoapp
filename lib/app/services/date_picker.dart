import 'package:flutter/material.dart';

class DatePicker {
  static Future datePicker(context) async {
    final pickDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));

    if (pickDate != null) {
      return pickDate;
    } else {
      return null;
    }
  }
}
