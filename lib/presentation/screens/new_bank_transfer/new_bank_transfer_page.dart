// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:money_wise/core/mutable_object.dart';
import 'package:money_wise/presentation/widgets/amount_field_group.dart';

import 'package:money_wise/presentation/widgets/available_balance_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/text_input_field.dart';

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
              const AvailableBalanceCard(),
              const VGap(gap: 10),
              GradientCard(
                title: "Transfer money to",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VGap(gap: 20),
                    const TextRegular("Bank", color: Colors.white, thin: true),
                    const VGap(),
                    SelectBankField(onSelected: (bank) {}),
                    const VGap(gap: 20),
                    const TextRegular("Account number",
                        color: Colors.white, thin: true),
                    const VGap(),
                    TextInputField(
                      keyboardType: TextInputType.number,
                      //Input formatter for bank account number
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ],
                ),
              ),
              const VGap(gap: 10),
              GradientCard(
                  title: "Transaction details",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VGap(gap: 20),
                      const AmountFieldGroup(),
                      const VGap(gap: 20),
                      const TextRegular("Description",
                          color: Colors.white, thin: true),
                      const VGap(),
                      const TextInputField(),
                      const VGap(gap: 20),
                      GlassButton(text: "Send", onPressed: () {}),
                    ],
                  )),
              const VGap(gap: 10),
            ],
          ),
        ));
  }
}

class SelectBankField extends StatelessWidget {
  final Function(String) onSelected;

  SelectBankField({
    super.key,
    required this.onSelected,
  });

  List<String> _getSuggestions(String search) {
    return _banks
        .where(
            (element) => element.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  static const _banks = [
    "JP Morgan",
    "Bank of America",
    "Chase",
    "Wells Fargo",
    "Citibank",
    "Goldman Sachs",
    "Morgan Stanley"
  ];

  final _mController = MutableObject(TextEditingController());
  final _mFocusNode = MutableObject(FocusNode());

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      builder: (context, controller, focusNode) {
        _mController.value = controller;
        _mFocusNode.value = focusNode;
        return TextInputField(
          controller: controller,
          focusNode: focusNode,
        );
      },
      itemBuilder: (context, suggestion) {
        return SuggestedItem(
          value: suggestion,
          context: context,
          controller: _mController.value,
          focusNode: _mFocusNode.value,
        );
      },
      onSelected: onSelected,
      suggestionsCallback: _getSuggestions,
    );
  }
}

class SuggestedItem extends StatelessWidget {
  final String value;
  final BuildContext context;
  final TextEditingController controller;
  final FocusNode focusNode;

  const SuggestedItem(
      {super.key,
      required this.value,
      required this.context,
      required this.controller,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.text = value;
            focusNode.unfocus();
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    color: theme.primaryColorDark,
                    size: 16,
                  ),
                  const HGap(gap: 10),
                  TextRegular(value, color: theme.primaryColorDark),
                ],
              )),
        ),
        Divider(
          color: theme.primaryColorDark,
          height: 0,
        ),
      ],
    );
  }
}
