import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_wise/application/auth/auth_cubit.dart';
import 'package:money_wise/presentation/widgets/gradient_box.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class AvailableBalanceCard extends StatelessWidget {
  const AvailableBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
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
    );
  }
}
