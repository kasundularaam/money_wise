import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/screens/send_money/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/gradient_box.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class SendFavoritePage extends HookWidget {
  final User favoriteUser;

  const SendFavoritePage({super.key, required this.favoriteUser});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final amountController = useTextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Send Favorite"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GradientBox(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return TextMedium(
                            state.totalBalance,
                            color: theme.primaryColorLight,
                            bold: true,
                          );
                        },
                      ),
                      const TextRegular(
                        "Available balance in your account",
                        color: Colors.white,
                        thin: true,
                      ),
                    ],
                  ),
                ),
              ),
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
