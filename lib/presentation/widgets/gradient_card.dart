// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:money_wise/presentation/widgets/gradient_box.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final Widget child;

  const GradientCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GradientBox(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextMedium(
            title,
            color: theme.primaryColorLight,
            thin: true,
          ),
          child
        ],
      ),
    );
  }
}
