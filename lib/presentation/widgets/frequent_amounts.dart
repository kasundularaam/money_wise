import 'package:flutter/material.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class FrequentAmounts extends StatelessWidget {
  final Function(String) onSelected;

  const FrequentAmounts({super.key, required this.onSelected});

  static const _amounts = ["100", "500", "1000", "5000", "10000"];

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _amounts
            .map(
              (amount) => _AmountChip(
                amount: amount,
                onPressed: () => onSelected(amount),
              ),
            )
            .toList());
  }
}

class _AmountChip extends StatelessWidget {
  final String amount;
  final Function() onPressed;

  const _AmountChip({required this.amount, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(.4),
          shape: const StadiumBorder(side: BorderSide(color: Colors.white)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: TextRegular(
          "Rs. $amount",
          color: Colors.white,
          bold: true,
        ),
      ),
    );
  }
}
