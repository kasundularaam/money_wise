import 'package:flutter/material.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class ProfileAction extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final bool isFirst;
  final bool isLast;

  const ProfileAction({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(20) : Radius.zero,
          bottom: isLast ? const Radius.circular(20) : Radius.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const HGap(gap: 20),
              TextRegular(
                text,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
