import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:money_wise/core/extensions/date_time_x.dart';
import 'package:money_wise/domain/calendar_item/calendar_item.dart';
import 'package:money_wise/domain/calendar_item/i_calendar_repo.dart';

@LazySingleton(as: ICalendarRepo)
class CalendarRepo implements ICalendarRepo {
  @override
  String get currentMonth => _getCurrentMonthYear();

  String _getCurrentMonthYear() {
    DateTime now = DateTime.now();
    return DateFormat('MMMM yyyy').format(now);
  }

  @override
  List<CalendarItem> getCalenderItems() {
    final int year = DateTime.now().year;
    final int month = DateTime.now().month;
    List<CalendarItem> items = [];

    // Add titles for the days of the week
    List<String> titles = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    items.addAll(titles
        .map((title) => CalendarItem.fromValue(
            value: title, isTitle: true, isSunday: title == "Sun"))
        .toList());

    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

    int firstWeekday =
        firstDayOfMonth.weekday % 7; // Adjust so that Sunday is 0
    int daysInMonth = lastDayOfMonth.day;

    // Add previous month's days
    int daysInPreviousMonth = DateTime(year, month, 0).day;
    for (int i = firstWeekday; i > 0; i--) {
      int day = daysInPreviousMonth - i + 1;
      DateTime date = DateTime(year, month - 1, day);
      items.add(CalendarItem.fromValue(
        value: day.toString(),
        isSunday: date.weekday % 7 == 0,
        isToday: date.isSameDate(now),
        isCurrentMonth: false,
      ));
    }

    // Add current month's days
    for (int i = 1; i <= daysInMonth; i++) {
      DateTime date = DateTime(year, month, i);
      items.add(CalendarItem.fromValue(
        value: i.toString(),
        isSunday: date.weekday % 7 == 0,
        isToday: date.isSameDate(now),
        isCurrentMonth: true,
      ));
    }

    // Add next month's days
    int remainingDays = 7 - (items.length % 7);
    if (remainingDays < 7) {
      for (int i = 1; i <= remainingDays; i++) {
        DateTime date = DateTime(year, month + 1, i);
        items.add(CalendarItem.fromValue(
          value: i.toString(),
          isSunday: date.weekday % 7 == 0,
          isToday: date.isSameDate(now),
          isCurrentMonth: false,
        ));
      }
    }

    return items;
  }
}
