import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/widgets/amount_field_group.dart';
import 'package:money_wise/presentation/widgets/available_balance_card.dart';
import 'package:money_wise/presentation/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';
import 'package:money_wise/presentation/widgets/text_input_field.dart';

@RoutePage()
class SendFavoritePage extends StatelessWidget {
  final User favoriteUser;

  const SendFavoritePage({super.key, required this.favoriteUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Send Favorite"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const AvailableBalanceCard(),
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
                      const AmountFieldGroup(),
                      const VGap(gap: 20),
                      const TextRegular("Description",
                          color: Colors.white, thin: true),
                      const VGap(),
                      const TextInputField(),
                      const VGap(gap: 20),
                      GlassButton(text: "Send", onPressed: () {})
                    ],
                  ))
            ],
          ),
        ));
  }
}
