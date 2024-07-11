import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeActionCard extends StatelessWidget {
  final String text;
  final String image;
  final bool isLeft;
  final double height;
  final double width;
  final Function() onPressed;

  const HomeActionCard(
      {super.key,
      required this.text,
      required this.image,
      this.isLeft = false,
      required this.height,
      required this.width,
      required this.onPressed});

  List<Color> _gradientColors(ThemeData theme) {
    final colors = [
      theme.primaryColorDark,
      theme.primaryColor,
      theme.primaryColor.withOpacity(.5),
      Colors.transparent,
      Colors.transparent,
    ];
    return isLeft ? colors.reversed.toList() : colors;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: theme.primaryColorDark,
            ),
            Align(
              alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Image.asset(
                image,
                width: width - width / 4,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _gradientColors(theme),
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
            Positioned(
              left: isLeft ? 40 : null,
              right: isLeft ? null : 40,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold)
                        .fontFamily),
                textAlign: isLeft ? TextAlign.left : TextAlign.end,
              ),
            ),
            Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onPressed,
                splashColor: theme.primaryColorLight.withOpacity(.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
