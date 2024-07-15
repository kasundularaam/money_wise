import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/load_favorites/load_favorites_cubit.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/screens/send_money/widgets/favorite_card.dart';
import 'package:money_wise/presentation/widgets/big_action_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() {
          _isVisible = false;
        });
      }
    } else if (_scrollController.position.atEdge) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

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
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isVisible ? 200 : 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BigActionCard(
                    text: "New\nBank\nTransfer",
                    image: "assets/images/backgrounds/send-money.png",
                    height: 160,
                    width: MediaQuery.sizeOf(context).width,
                    onPressed: () {}),
              ),
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
                      TextMedium("Favorites",
                          color: theme.primaryColorLight, thin: true),
                      const VGap(gap: 20),
                      Expanded(
                        child:
                            BlocBuilder<LoadFavoritesCubit, LoadFavoritesState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                                loading: () => const Center(
                                    child: CircularProgressIndicator()),
                                loaded: (favorites) => ListView.builder(
                                    controller: _scrollController,
                                    itemCount: favorites.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: FavoriteCard(
                                              favoriteUser: favorites[index]),
                                        )),
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
        ),
      ),
    );
  }
}
