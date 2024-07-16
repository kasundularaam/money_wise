// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/load_brands/load_brands_cubit.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/router/app_router.dart';
import 'package:money_wise/presentation/widgets/light_box.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

@RoutePage()
class PayBillsPage extends StatefulWidget implements AutoRouteWrapper {
  const PayBillsPage({super.key});

  @override
  State<PayBillsPage> createState() => _PayBillsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadBrandsCubit>()..loadBrands(),
      child: this,
    );
  }
}

class _PayBillsPageState extends State<PayBillsPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
      ),
      body: Column(
        children: [
          AnimatedContainer(
              height: _isVisible ? 200 : 0,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              duration: const Duration(milliseconds: 300)),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColorDark,
                    theme.primaryColor,
                  ],
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  const VGap(gap: 10),
                  TextMedium(
                    "Pay your Bill at",
                    color: theme.primaryColorLight,
                    thin: true,
                  ),
                  const VGap(gap: 20),
                  Expanded(
                    child: BlocBuilder<LoadBrandsCubit, LoadBrandsState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            orElse: () => const TextRegular(
                                  "Payable Brands will appear here..",
                                  color: Colors.white,
                                ),
                            loaded: (brands) => ListView.builder(
                                controller: _scrollController,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                itemCount: brands.length,
                                itemBuilder: (context, index) => BrandCard(
                                      brand: brands[index],
                                      onPressed: () => context.router.push(
                                          ProcessBillRoute(
                                              brand: brands[index])),
                                    )));
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final Brand brand;
  final Function()? onPressed;

  const BrandCard({
    super.key,
    required this.brand,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: LightBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: brand.logo, radius: 30),
                  const HGap(gap: 10),
                  TextMedium(
                    brand.name,
                    color: Colors.white,
                    bold: true,
                  )
                ],
              ),
              const Divider(color: Colors.white),
              TextRegular(
                brand.description,
                color: Colors.white,
                thin: true,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
