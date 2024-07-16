import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/domain/day_transactions/day_transactions.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/transaction_card.dart';
import 'package:money_wise/presentation/widgets/gradient_card.dart';

class DayTransactionsCard extends StatelessWidget {
  final DayTransactions dayTransactions;

  const DayTransactionsCard({super.key, required this.dayTransactions});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      title: dayTransactions.formattedDate,
      child: Column(
        children: List.generate(
          dayTransactions.transactions.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              bottom: index == dayTransactions.transactions.length - 1 ? 0 : 10,
              top: index == 0 ? 20 : 0,
            ),
            child: TransactionCard(
              transaction: dayTransactions.transactions[index],
              user: context.read<AuthCubit>().state.userOption.getOrCrash(),
            ),
          ),
        ),
      ),
    );
  }
}
