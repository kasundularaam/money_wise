import 'package:flutter/material.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const GlassButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(.4),
      shape: const StadiumBorder(side: BorderSide(color: Colors.white)),
      child: InkWell(
        onTap: onPressed,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextMedium(
                  text,
                  thin: true,
                  align: TextAlign.center,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.white.withOpacity(0.2),
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
