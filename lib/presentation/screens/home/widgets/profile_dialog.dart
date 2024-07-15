import 'package:flutter/material.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/screens/home/widgets/profile_action.dart';
import 'package:money_wise/presentation/widgets/button.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({
    super.key,
    required this.theme,
    required this.user,
  });

  final ThemeData theme;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.redAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColorDark,
                    theme.primaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextMedium(
                    "Profile",
                    color: theme.primaryColorLight,
                    thin: true,
                  ),
                  const VGap(gap: 10),
                  ProfileAvatar(imageUrl: user.imageUrl, radius: 40),
                  const VGap(gap: 10),
                  TextLarge(
                    user.name,
                    color: theme.primaryColorLight,
                    bold: true,
                  ),
                  TextRegular(
                    user.bankName,
                    color: Colors.white,
                    thin: true,
                  ),
                  const VGap(gap: 20),
                  Container(
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    child: Column(
                      children: [
                        ProfileAction(
                          text: "Settings",
                          icon: Icons.settings_rounded,
                          isFirst: true,
                          onPressed: () {},
                        ),
                        Divider(color: Colors.white, thickness: 1, height: 0),
                        ProfileAction(
                          text: "Report",
                          icon: Icons.report_rounded,
                          onPressed: () {},
                        ),
                        Divider(color: Colors.white, thickness: 1, height: 0),
                        ProfileAction(
                          text: "Rate Us",
                          icon: Icons.star_rate_rounded,
                          onPressed: () {},
                        ),
                        Divider(color: Colors.white, thickness: 1, height: 0),
                        ProfileAction(
                          text: "About Us",
                          icon: Icons.info_rounded,
                          isLast: true,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GlassButton(text: "Logout", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
