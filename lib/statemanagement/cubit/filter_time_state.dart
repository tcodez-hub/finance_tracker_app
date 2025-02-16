part of 'filter_time_cubit.dart';

@immutable
sealed class FilterTimeState {}

final class FilterTimeInitial extends FilterTimeState {}

class FilterTimeUpdated extends FilterTimeState {
  final Calendar calendarMode;
  final DateTime startday;
  final DateTime endday;
  final String formatDate;

  FilterTimeUpdated({
    required this.calendarMode,
    required this.startday,
    required this.endday,
    required this.formatDate,
  });
}
