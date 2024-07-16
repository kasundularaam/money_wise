import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_item.freezed.dart';

@freezed
abstract class CalendarItem with _$CalendarItem {
  const factory CalendarItem({
    required String value,
    required bool isTitle,
    required bool isSunday,
    required bool isToday,
    required bool isCurrentMonth,
  }) = _CalendarItem;
  factory CalendarItem.fromValue({
    required String value,
    bool? isTitle,
    bool? isSunday,
    bool? isToday,
    bool? isCurrentMonth,
  }) {
    return CalendarItem(
      value: value,
      isTitle: isTitle ?? false,
      isSunday: isSunday ?? false,
      isToday: isToday ?? false,
      isCurrentMonth: isCurrentMonth ?? true,
    );
  }
}
