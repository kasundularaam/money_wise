// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:money_wise/domain/calendar_item/calendar_item.dart';
import 'package:money_wise/domain/calendar_item/i_calendar_repo.dart';

part 'calendar_cubit.freezed.dart';
part 'calendar_state.dart';

@injectable
class CalendarCubit extends Cubit<CalendarState> {
  final ICalendarRepo _calenderRepo;
  CalendarCubit(
    this._calenderRepo,
  ) : super(CalendarState.initial());

  void loadCalenderItems() {
    final calenderItems = _calenderRepo.getCalenderItems();
    final currentMonth = _calenderRepo.currentMonth;
    emit(CalendarState(
      calenderItems: calenderItems,
      currentMonth: currentMonth,
    ));
  }
}
