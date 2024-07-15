import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/screens/send_money/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/gradient_box.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class SendFavoritePage extends StatelessWidget {
  final User favoriteUser;

  const SendFavoritePage({super.key, required this.favoriteUser});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Send Favorite"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              const VGap(gap: 20),
              GradientCard(
                title: "Send money to",
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    const VGap(gap: 20),
                    FavoriteCard(favoriteUser: favoriteUser),
                  ],
                ),
              ),
              const VGap(gap: 20),
              GradientCard(
                  title: "Transaction details",
                  child: Column(
                    children: [],
                  ))
            ],
          ),
        ));
  }
}
