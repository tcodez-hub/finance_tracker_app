import 'package:finance_tracker_app/core/custom_date_format.dart';
import 'package:finance_tracker_app/core/enums.dart';
import 'package:finance_tracker_app/statemanagement/cubit/filter_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet {
  static void showTimeFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Today"),
                    subtitle: Text(
                      CustomDateFormat.currentDay('MMMM d, y').formatted,
                    ),
                    onTap: () {
                      context.read<FilterTimeCubit>().resetoffset();
                      context.read<FilterTimeCubit>().updateDateTime(
                        Calendar.day,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("This week"),
                    subtitle: Text(
                      CustomDateFormat.currentWeek('MMMM d').formatted,
                    ),
                    onTap: () {
                      context.read<FilterTimeCubit>().resetoffset();
                      context.read<FilterTimeCubit>().updateDateTime(
                        Calendar.week,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("This month"),
                    subtitle: Text(CustomDateFormat.currentMonth().formatted),
                    onTap: () {
                      context.read<FilterTimeCubit>().resetoffset();
                      context.read<FilterTimeCubit>().updateDateTime(
                        Calendar.month,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("This year"),
                    subtitle: Text(CustomDateFormat.currentYear().formatted),
                    onTap: () {
                      context.read<FilterTimeCubit>().resetoffset();
                      context.read<FilterTimeCubit>().updateDateTime(
                        Calendar.year,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("All Time"),
                    onTap: () {
                      context.read<FilterTimeCubit>().start = DateTime(2000);
                      context.read<FilterTimeCubit>().end = DateTime(2100);
                      context.read<FilterTimeCubit>().resetoffset();
                      context.read<FilterTimeCubit>().updateDateTime(
                        Calendar.all,
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
