import 'package:flutter/material.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool selected;

  const ToggleButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
        child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const StadiumBorder(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: ShapeDecoration(
            color: selected ? Colors.white.withOpacity(.4) : Colors.transparent,
            shape: StadiumBorder(
                side: selected
                    ? const BorderSide(color: Colors.white)
                    : BorderSide.none),
          ),
          child: TextMedium(
            text,
            align: TextAlign.center,
            thin: true,
            color: selected ? Colors.white : theme.primaryColorLight,
          ),
        ),
      ),
    ));
  }
}
