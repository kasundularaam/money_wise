import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/domain/day_transactions/day_transactions.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/transaction_card.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class DayTransactionsCard extends StatelessWidget {
  final DayTransactions dayTransactions;

  const DayTransactionsCard({super.key, required this.dayTransactions});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
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
          const VGap(gap: 10),
          TextMedium(
            dayTransactions.formattedDate,
            thin: true,
            color: theme.primaryColorLight,
          ),
          const VGap(gap: 20),
          Column(
            children: List.generate(
              dayTransactions.transactions.length,
              (index) => TransactionCard(
                isLast: index == dayTransactions.transactions.length - 1,
                transaction: dayTransactions.transactions[index],
                user: context.read<AuthCubit>().state.userOption.getOrCrash(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
