import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/load_favorites/load_favorites_cubit.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/screens/send_money/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/big_action_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class SendMoneyPage extends StatelessWidget {
  const SendMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<LoadFavoritesCubit>()..loadFavorites(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Send Money"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: BigActionCard(
                    text: "New\nBank\nTransfer",
                    image: "assets/images/backgrounds/send-money.png",
                    height: 160,
                    width: MediaQuery.sizeOf(context).width,
                    onPressed: () {}),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          theme.primaryColorDark,
                          theme.primaryColor,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        const VGap(gap: 20),
                        TextLarge("Favorites",
                            color: theme.primaryColorLight, bold: true),
                        const VGap(gap: 20),
                        Expanded(
                          child: BlocBuilder<LoadFavoritesCubit,
                              LoadFavoritesState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                  loading: () => const Center(
                                      child: CircularProgressIndicator()),
                                  loaded: (favorites) => ListView.builder(
                                      itemCount: favorites.length,
                                      itemBuilder: (context, index) =>
                                          FavoriteCard(
                                              favoriteUser: favorites[index])),
                                  orElse: () => const TextRegular(
                                        "Your favorites will appear here...",
                                        color: Colors.white,
                                      ));
                            },
                          ),
                        )
                      ],
                    )),
              )
            ],
          )),
    );
  }
}
