import 'package:flutter/material.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/presentation/widgets/light_box.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class BrandCard extends StatelessWidget {
  final Brand brand;
  final Function()? onPressed;

  const BrandCard({
    super.key,
    required this.brand,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: LightBox(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ProfileAvatar(imageUrl: brand.logo, radius: 30),
                  const HGap(gap: 10),
                  TextMedium(
                    brand.name,
                    color: Colors.white,
                    bold: true,
                  )
                ],
              ),
              const Divider(color: Colors.white),
              TextRegular(
                brand.description,
                color: Colors.white,
                thin: true,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
