// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/screens/home/widgets/profile_dialog.dart';
import 'package:money_wise/presentation/widgets/big_action_card.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!state.isAuthenticated) {
            return const Center(child: Text("Hey What are you doing here?"));
          }
          if (state.userOption.isSome()) {
            final user = state.userOption.getOrCrash();
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme.primaryColorDark,
                        theme.primaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextMedium(
                                    state.greeting,
                                    color: theme.primaryColorLight,
                                    bold: true,
                                  ),
                                  TextMedium(
                                    user.name,
                                    color: Colors.white,
                                    thin: true,
                                  )
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () => showDialog(
                                        context: context,
                                        builder: (context) => ProfileDialog(
                                            theme: theme, user: user),
                                      ),
                                  customBorder: const CircleBorder(),
                                  child: ProfileAvatar(
                                      imageUrl: user.imageUrl, radius: 26))
                            ],
                          ),
                          const VGap(gap: 20),
                          TextLarge(
                            state.totalBalance,
                            color: theme.primaryColorLight,
                            bold: true,
                          ),
                          const TextMedium(
                            "Total Balance",
                            color: Colors.white,
                            thin: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: GlassButton(
                                text: "See all transactions",
                                onPressed: () => context.router
                                    .push(const TransactionsRoute())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VGap(gap: 20),
                Expanded(
                  child: LayoutBuilder(builder: (context, constrains) {
                    final cardHeight = (constrains.maxHeight - 60) / 3;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          BigActionCard(
                              text: "Send\nMoney",
                              image: "assets/images/backgrounds/send-money.png",
                              height: cardHeight,
                              width: constrains.maxWidth,
                              onPressed: () =>
                                  context.router.push(const SendMoneyRoute())),
                          const Spacer(),
                          BigActionCard(
                              text: "Pay\nBills",
                              image: "assets/images/backgrounds/pay-bills.png",
                              height: cardHeight,
                              width: constrains.maxWidth,
                              isLeft: true,
                              onPressed: () =>
                                  context.router.push(const PayBillsRoute())),
                          const Spacer(),
                          BigActionCard(
                              text: "Get\nSupport",
                              image:
                                  "assets/images/backgrounds/get-support.png",
                              height: cardHeight,
                              width: constrains.maxWidth,
                              onPressed: () =>
                                  context.router.push(const GetSupportRoute())),
                          const Spacer(),
                        ],
                      ),
                    );
                  }),
                )
              ],
            );
          }
          return const Center(child: Text("User not found!"));
        },
      ),
    );
  }
}
