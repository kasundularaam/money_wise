import 'package:flutter/material.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/toggle_button.dart';
import 'package:money_wise/presentation/widgets/space.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        gradient: LinearGradient(colors: [
          theme.primaryColorDark,
          theme.primaryColor,
        ]),
      ),
      child: Row(
        children: [
          ToggleButton(
            text: "All",
            onPressed: () {},
            selected: true,
          ),
          const HGap(gap: 10),
          ToggleButton(
            text: "Income",
            onPressed: () {},
            selected: false,
          ),
          const HGap(gap: 10),
          ToggleButton(
            text: "Expense",
            onPressed: () {},
            selected: false,
          ),
        ],
      ),
    );
  }
}
