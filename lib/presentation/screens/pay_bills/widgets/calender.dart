import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/calendar/calendar_cubit.dart';
import 'package:money_wise/domain/calendar_item/calendar_item.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class Calender extends StatelessWidget {
  const Calender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return GradientCard(
          title: state.currentMonth,
          child: GridView.count(
            key: key,
            shrinkWrap: true,
            crossAxisCount: 7,
            children: state.calenderItems
                .map((item) => _CalendarItemView(item: item))
                .toList(),
          ),
        );
      },
    );
  }
}

class _CalendarItemView extends StatelessWidget {
  final CalendarItem item;

  const _CalendarItemView({required this.item});

  Color get color {
    if (item.isSunday && item.isCurrentMonth) {
      return const Color.fromARGB(255, 255, 133, 124);
    }

    if (!item.isCurrentMonth) {
      return Colors.yellow;
    }

    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: ShapeDecoration(
          color: item.isToday ? Colors.white.withOpacity(.4) : null,
          shape: CircleBorder(
            side: item.isToday
                ? const BorderSide(color: Colors.white)
                : BorderSide.none,
          )),
      child: Center(
          child: TextRegular(
        item.value,
        bold: item.isTitle,
        color: color,
      )),
    );
  }
}
