import 'package:flutter/material.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const GlassButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(.4),
      shape: const StadiumBorder(
          side: BorderSide(
              color: Colors.white)), // Make the material color transparent
      child: InkWell(
        onTap: onPressed,
        customBorder: const StadiumBorder(), // Match the Material's border
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HGap(gap: 100),
              Expanded(
                child: TextMedium(
                  text,
                  thin: true,
                  align: TextAlign.center,
                  color: Colors.white,
                ),
              ),
              const HGap(gap: 60),
              Container(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: Colors.white.withOpacity(0.3),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ),
              const HGap(gap: 12),
            ],
          ),
        ),
      ),
    );
  }
}
