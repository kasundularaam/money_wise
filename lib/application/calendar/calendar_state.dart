part of 'calendar_cubit.dart';

@freezed
abstract class CalendarState with _$CalendarState {
  const factory CalendarState({
    required List<CalendarItem> calenderItems,
    required String currentMonth,
  }) = _CalendarData;

  factory CalendarState.initial() => const CalendarState(
        calenderItems: [],
        currentMonth: '',
      );
}
