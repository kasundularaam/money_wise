import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/widgets/available_balance_card.dart';
import 'package:money_wise/presentation/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/frequent_amounts.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class SendFavoritePage extends HookWidget {
  final User favoriteUser;

  const SendFavoritePage({super.key, required this.favoriteUser});

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Send Favorite"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AvailableBalanceCard(),
              const VGap(gap: 10),
              GradientCard(
                title: "Send money to",
                child: Column(
                  children: [
                    const VGap(gap: 20),
                    FavoriteCard(favoriteUser: favoriteUser, radius: 8),
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
                      const TextRegular("Amount",
                          color: Colors.white, thin: true),
                      const VGap(),
                      TextField(
                        controller: amountController,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)
                                  .fontFamily,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(prefix: Text("Rs. ")),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                          FilteringTextInputFormatter.deny(RegExp(r"\s")),
                        ],
                      ),
                      const VGap(),
                      FrequentAmounts(
                          onSelected: (amount) =>
                              amountController.text = "$amount.00"),
                      const VGap(gap: 20),
                      const TextRegular("Description",
                          color: Colors.white, thin: true),
                      const VGap(),
                      TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)
                                  .fontFamily,
                        ),
                      ),
                      const VGap(gap: 20),
                      GlassButton(text: "Send", onPressed: () {})
                    ],
                  ))
            ],
          ),
        ));
  }
}
