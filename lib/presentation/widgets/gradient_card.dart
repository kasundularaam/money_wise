// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:money_wise/presentation/widgets/gradient_box.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsets padding;

  const GradientCard({
    super.key,
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GradientBox(
      padding: padding,
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
