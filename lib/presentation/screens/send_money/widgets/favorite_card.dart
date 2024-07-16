// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class FavoriteCard extends StatelessWidget {
  final User favoriteUser;
  final Function()? onPressed;
  final double? radius;

  const FavoriteCard({
    super.key,
    required this.favoriteUser,
    this.onPressed,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.white)),
              color: Colors.white.withOpacity(.4)),
          child: Row(
            children: [
              ProfileAvatar(imageUrl: favoriteUser.imageUrl, radius: 30),
              const HGap(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMedium(
                    favoriteUser.name,
                    color: Colors.white,
                    bold: true,
                  ),
                  const VGap(),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 20, right: 8),
                    decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(.4),
                        shape: const StadiumBorder(
                            side: BorderSide(color: Colors.white))),
                    child: Row(
                      children: [
                        TextRegular(favoriteUser.bankName,
                            color: theme.primaryColorDark),
                        const HGap(),
                        Icon(
                          Icons.account_balance_rounded,
                          color: theme.primaryColorDark,
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
