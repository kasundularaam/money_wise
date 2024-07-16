import 'package:money_wise/domain/calendar_item/calendar_item.dart';

abstract class ICalendarRepo {
  List<CalendarItem> getCalenderItems();
  String get currentMonth;
}
