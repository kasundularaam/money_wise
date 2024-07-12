import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/load_transactions/load_transactions_cubit.dart';
import 'package:money_wise/application/load_transactions/transactions_filter.dart';
import 'package:money_wise/presentation/screens/transactions/widgets/toggle_button.dart';
import 'package:money_wise/presentation/widgets/space.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadTransactionsCubit, LoadTransactionsState>(
      builder: (context, state) {
        return state.maybeWhen(
            loading: (filter) => _ActiveFilter(filter: filter),
            loaded: (filter, _) => _ActiveFilter(filter: filter),
            orElse: () => const _ActiveFilter(filter: TransactionsFilter.all));
      },
    );
  }
}

class _ActiveFilter extends StatelessWidget {
  final TransactionsFilter filter;

  const _ActiveFilter({required this.filter});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: ShapeDecoration(
          shape: const StadiumBorder(
              side: BorderSide(color: Colors.white, width: 2)),
          gradient: LinearGradient(colors: [
            theme.primaryColorDark,
            theme.primaryColor,
          ]),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              blurRadius: 8,
              spreadRadius: 4,
              offset: const Offset(0, 8),
            )
          ]),
      child: Row(
        children: [
          ToggleButton(
            text: "All",
            onPressed: () => context
                .read<LoadTransactionsCubit>()
                .loadTransactions(filter: TransactionsFilter.all),
            selected: filter == TransactionsFilter.all,
          ),
          const HGap(gap: 10),
          ToggleButton(
            text: "Income",
            onPressed: () => context
                .read<LoadTransactionsCubit>()
                .loadTransactions(filter: TransactionsFilter.income),
            selected: filter == TransactionsFilter.income,
          ),
          const HGap(gap: 10),
          ToggleButton(
            text: "Expense",
            onPressed: () => context
                .read<LoadTransactionsCubit>()
                .loadTransactions(filter: TransactionsFilter.expense),
            selected: filter == TransactionsFilter.expense,
          ),
        ],
      ),
    );
  }
}
