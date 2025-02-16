import 'package:intl/intl.dart';

import 'package:intl/intl.dart';

class CustomDateFormat {
  /// Returns the formatted current day and its `DateTime` object.
  static ({String formatted, DateTime start, DateTime end}) currentDay(
    String format, {
    int dayOffset = 0,
  }) {
    DateTime adjustedDate = DateTime.now().add(Duration(days: dayOffset));
    return (
      formatted: DateFormat(format).format(adjustedDate),
      start: DateTime(
        adjustedDate.year,
        adjustedDate.month,
        adjustedDate.day,
        0,
        0,
        0,
      ), // Start of the day
      end: DateTime(
        adjustedDate.year,
        adjustedDate.month,
        adjustedDate.day,
        23,
        59,
        59,
      ), // End of the day
    );
  }

  /// Returns the formatted current week and its `DateTime` start & end.
  static ({String formatted, DateTime start, DateTime end}) currentWeek(
    String format, {
    int weekOffset = 0,
  }) {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(
      Duration(days: now.weekday - 1),
    ); // Monday
    DateTime endOfWeek = startOfWeek.add(Duration(days: 6)); // Sunday

    // Apply week offset
    startOfWeek = startOfWeek.add(Duration(days: weekOffset * 7));
    endOfWeek = endOfWeek.add(Duration(days: weekOffset * 7));

    return (
      formatted:
          "${DateFormat(format).format(startOfWeek)} - ${DateFormat(format).format(endOfWeek)}",
      start: DateTime(
        startOfWeek.year,
        startOfWeek.month,
        startOfWeek.day,
        0,
        0,
        0,
      ),
      end: DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day, 23, 59, 59),
    );
  }

  /// Returns the formatted current month and its `DateTime` start & end.
  static ({String formatted, DateTime start, DateTime end}) currentMonth({
    int monthOffset = 0,
  }) {
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year, now.month + monthOffset, 1);
    DateTime lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);

    return (
      formatted: DateFormat("MMMM yyyy").format(firstDay),
      start: DateTime(firstDay.year, firstDay.month, firstDay.day, 0, 0, 0),
      end: DateTime(lastDay.year, lastDay.month, lastDay.day, 23, 59, 59),
    );
  }

  /// Returns the formatted current year and its `DateTime` start & end.
  static ({String formatted, DateTime start, DateTime end}) currentYear({
    int yearOffset = 0,
  }) {
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year + yearOffset, 1, 1);
    DateTime lastDay = DateTime(firstDay.year, 12, 31);

    return (
      formatted: DateFormat("yyyy").format(firstDay),
      start: DateTime(firstDay.year, firstDay.month, firstDay.day, 0, 0, 0),
      end: DateTime(lastDay.year, lastDay.month, lastDay.day, 23, 59, 59),
    );
  }
}
