import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/presentation/widgets/amount_field_group.dart';
import 'package:money_wise/presentation/widgets/brand_card.dart';
import 'package:money_wise/presentation/widgets/available_balance_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/text_input_field.dart';

@RoutePage()
class ProcessBillPage extends StatelessWidget {
  final Brand brand;

  const ProcessBillPage({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Process Bill"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const AvailableBalanceCard(),
            const VGap(gap: 10),
            GradientCard(
              title: "Pay bill at",
              child: Column(
                children: [
                  const VGap(gap: 20),
                  BrandCard(brand: brand),
                ],
              ),
            ),
            const VGap(gap: 10),
            GradientCard(
              title: "Billing information",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VGap(gap: 20),
                  const TextRegular(
                    "Account / Billing No",
                    color: Colors.white,
                  ),
                  const VGap(),
                  const TextInputField(keyboardType: TextInputType.number),
                  const VGap(gap: 20),
                  const AmountFieldGroup(),
                  const VGap(gap: 20),
                  GlassButton(text: "Pay", onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
