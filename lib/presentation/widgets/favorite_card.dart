// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/widgets/light_box.dart';
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: LightBox(
          child: Row(
            children: [
              ProfileAvatar(imageUrl: favoriteUser.imageUrl, radius: 30),
              const HGap(gap: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMedium(
                    favoriteUser.name,
                    color: Colors.white,
                    bold: true,
                  ),
                  const VGap(),
                  Row(
                    children: [
                      const Icon(
                        Icons.account_balance_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const HGap(),
                      TextRegular(favoriteUser.bankName, color: Colors.white),
                    ],
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
