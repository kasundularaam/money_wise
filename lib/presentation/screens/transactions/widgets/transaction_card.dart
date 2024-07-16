// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/domain/transaction/transaction.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/presentation/widgets/profile_avatar.dart';
import 'package:money_wise/presentation/widgets/space.dart';
import 'package:money_wise/presentation/widgets/text.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final User user;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.user,
  });

  String get leftImage {
    if (transaction.brand.isSome()) {
      return transaction.sender.imageUrl;
    }
    if (transaction.receiver.isSome()) {
      final receiver = transaction.receiver.getOrCrash();
      if (receiver == user) {
        return receiver.imageUrl;
      }
    }
    return transaction.sender.imageUrl;
  }

  String get rightImage {
    if (transaction.brand.isSome()) {
      return transaction.brand.getOrCrash().logo;
    }
    if (transaction.receiver.isSome()) {
      final receiver = transaction.receiver.getOrCrash();
      if (receiver != user) {
        return receiver.imageUrl;
      }
    }
    return transaction.sender.imageUrl;
  }

  bool get isIncome {
    if (transaction.brand.isSome()) {
      return false;
    }
    return transaction.sender != user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: Colors.white),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: leftImage, radius: 26),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.white)),
                    color: Colors.white.withOpacity(.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (isIncome)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const ShapeDecoration(
                            color: Colors.green,
                            shape: CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      Expanded(
                        child: TextMedium(
                          "Rs.${transaction.amount}.00",
                          bold: true,
                          color: isIncome ? Colors.green : Colors.red,
                          align: TextAlign.center,
                        ),
                      ),
                      if (!isIncome)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const ShapeDecoration(
                            color: Colors.red,
                            shape: CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              ProfileAvatar(imageUrl: rightImage, radius: 26),
            ],
          ),
          const VGap(gap: 10),
          const Divider(
            color: Colors.white,
          ),
          const VGap(gap: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextMedium(
              transaction.title,
              bold: true,
              color: Colors.white,
            ),
          ),
          const VGap(gap: 10),
          Row(
            children: [
              _InfoChip(
                text: transaction.date,
                icon: Icons.today_rounded,
              ),
              const HGap(gap: 10),
              _InfoChip(
                text: transaction.time,
                icon: Icons.schedule_rounded,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;
  final IconData icon;

  const _InfoChip({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(.4),
        shape: const StadiumBorder(side: BorderSide(color: Colors.white)),
      ),
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextRegular(
            text,
            color: theme.primaryColorDark,
            bold: true,
          ),
          const HGap(),
          Icon(
            icon,
            color: theme.primaryColorDark,
            size: 16,
          )
        ],
      ),
    );
  }
}
