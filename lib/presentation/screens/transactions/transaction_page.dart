// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/load_transactions/load_transactions_cubit.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/day_transactions_card.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/filter.dart';

@RoutePage()
class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
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
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadTransactionsCubit>()..loadTransactions(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Transactions")),
        body: Stack(
          children: [
            BlocBuilder<LoadTransactionsCubit, LoadTransactionsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (filter, dayTransactions) => ListView.builder(
                    controller: _scrollController,
                    itemCount: dayTransactions.length,
                    itemBuilder: (context, index) {
                      return DayTransactionsCard(
                        dayTransactions: dayTransactions[index],
                      );
                    },
                  ),
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                left: 40,
                right: 40,
                bottom: _isVisible ? 20 : -100,
                child: const Filter())
          ],
        ),
      ),
    );
  }
}
