import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:money_wise/presentation/widgets/available_balance_card.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class NewBankTransferPage extends StatelessWidget {
  const NewBankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("New Bank Transfer"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AvailableBalanceCard(),
              const VGap(gap: 10),
              GradientCard(
                title: "Transfer money to",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VGap(gap: 20),
                    const TextRegular("Bank account number",
                        color: Colors.white, thin: true),
                    const VGap(),
                    SelectBankField(
                      onSelected: (bank) {},
                    ),
                    const VGap(),
                    const TextRegular("Amount",
                        color: Colors.white, thin: true),
                    const VGap(),
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const VGap(),
                    const TextRegular("Description",
                        color: Colors.white, thin: true),
                    const VGap(),
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SelectBankField extends StatelessWidget {
  final Function(String) onSelected;

  const SelectBankField({super.key, required this.onSelected});

  static const _banks = [
    "JP Morgan",
    "Bank of America",
    "Chase",
    "Wells Fargo",
    "Citibank",
    "Goldman Sachs",
    "Morgan Stanley"
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Autocomplete(
        optionsBuilder: (TextEditingValue textEditingValue) {
          return _banks
              .where((bank) => bank.contains(textEditingValue.text))
              .toList();
        },
        optionsViewBuilder: (context, onSelected, options) => Container(
              width: MediaQuery.of(context).size.width - 10,
              decoration: ShapeDecoration(
                color: theme.primaryColorLight,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options.map((bank) => TextRegular(bank)).toList()),
            ),
        onSelected: onSelected);
  }
}
