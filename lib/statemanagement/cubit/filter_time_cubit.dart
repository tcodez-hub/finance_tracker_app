import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:finance_tracker_app/core/custom_date_format.dart';
import 'package:finance_tracker_app/core/enums.dart';
import 'package:meta/meta.dart';

part 'filter_time_state.dart';

class FilterTimeCubit extends Cubit<FilterTimeState> {
  FilterTimeCubit() : super(FilterTimeInitial());

  int offset = 0;
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();

  void resetoffset() => offset = 0;

  void updateDateTime(Calendar calender, {int timeoffset = 0}) {
    offset += timeoffset;
    var currentDay = CustomDateFormat.currentDay(
      "MMMM d, y",
      dayOffset: offset,
    );
    var currentWeek = CustomDateFormat.currentWeek(
      "MMMM d",
      weekOffset: offset,
    );
    var currentMonth = CustomDateFormat.currentMonth(monthOffset: offset);
    var currentYear = CustomDateFormat.currentYear(yearOffset: offset);

    start = currentDay.start;
    end = currentDay.end;
    String format = currentDay.formatted;

    if (calender == Calendar.day) {
      start = currentDay.start;
      end = currentDay.end;
      format = currentDay.formatted;
    }
    if (calender == Calendar.week) {
      start = currentWeek.start;
      end = currentWeek.end;
      format = currentWeek.formatted;
    }
    if (calender == Calendar.month) {
      start = currentMonth.start;
      end = currentMonth.end;
      format = currentMonth.formatted;
    }
    if (calender == Calendar.year) {
      start = currentYear.start;
      end = currentYear.end;
      format = currentYear.formatted;
    }

    log(start.toIso8601String());
    log(end.toIso8601String());
    emit(
      FilterTimeUpdated(
        calendarMode: calender,
        startday: start,
        endday: end,
        formatDate: format,
      ),
    );
  }
}
