// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:money_wise/application/load_transactions/load_transactions_cubit.dart';
import 'package:money_wise/injection.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/day_transactions_card.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/filter.dart';
import 'package:money_wise/presentation/widgets/space.dart';

@RoutePage()
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadTransactionsCubit>()..loadTransactions(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Transactions")),
        body: Column(
          children: [
            const VGap(gap: 20),
            Filter(),
            const VGap(gap: 20),
            BlocBuilder<LoadTransactionsCubit, LoadTransactionsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (dayTransactions) => Expanded(
                    child: ListView.builder(
                      itemCount: dayTransactions.length,
                      itemBuilder: (context, index) {
                        return DayTransactionsCard(
                          dayTransactions: dayTransactions[index],
                        );
                      },
                    ),
                  ),
                  orElse: () => const Expanded(
                      child: Center(child: CircularProgressIndicator())),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
