import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:money_wise/presentation/widgets/frequent_amounts.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/text_input_field.dart';

class AmountFieldGroup extends HookWidget {
  const AmountFieldGroup({super.key});

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextRegular("Amount", color: Colors.white, thin: true),
        const VGap(),
        TextInputField(
          controller: amountController,
          keyboardType: TextInputType.number,
          prefix: const Text("Rs. "),
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            FilteringTextInputFormatter.deny(RegExp(r"\s")),
          ],
        ),
        const VGap(),
        FrequentAmounts(
            onSelected: (amount) => amountController.text = "$amount.00"),
      ],
    );
  }
}
