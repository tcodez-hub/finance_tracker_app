import 'package:finance_tracker_app/core/enums.dart';
import 'package:flutter/material.dart';

class CaldendarSegmentButton extends StatefulWidget {
  const CaldendarSegmentButton({super.key});

  @override
  State<CaldendarSegmentButton> createState() => _CalendarChoiceState();
}

class _CalendarChoiceState extends State<CaldendarSegmentButton> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(50), offset: Offset(0, 2), blurRadius: 8),
        ],
        border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
      ),
      child: SegmentedButton<Calendar>(
        segments: const <ButtonSegment<Calendar>>[
          ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day')),
          ButtonSegment<Calendar>(value: Calendar.week, label: Text('Week')),
          ButtonSegment<Calendar>(value: Calendar.month, label: Text('Month')),
          ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year')),
          ButtonSegment<Calendar>(value: Calendar.custom, label: Text('Custom')),
        ],
        selected: <Calendar>{calendarView},
        showSelectedIcon: false,
        onSelectionChanged: (Set<Calendar> newSelection) {
          setState(() {
            // By default there is only a single segment that can be
            // selected at one time, so its value is always the first
            // item in the selected set.
            calendarView = newSelection.first;
          });
        },
      ),
    );
  }
}
