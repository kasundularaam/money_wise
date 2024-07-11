// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:money_wise/domain/brand/brand.dart';
import 'package:uuid/uuid.dart';

class Brands {
  final List<Brand> brands;
  Brands(this.brands);

  factory Brands.init() {
    const uuid = Uuid();
    return Brands([
      Brand(
          id: uuid.v4(),
          name: "Abans",
          description: "Leading consumer electronics retailer",
          logo: "/assets/images/brands/abans.png"),
      Brand(
          id: uuid.v4(),
          name: "Singer",
          description: "Well-known for home appliances and electronics",
          logo: "/assets/images/brands/singer.png"),
      Brand(
          id: uuid.v4(),
          name: "AIA",
          description: "Insurance and financial services provider",
          logo: "/assets/images/brands/aia.png"),
      Brand(
          id: uuid.v4(),
          name: "SltMobitel",
          description: "Telecommunications and internet services",
          logo: "/assets/images/brands/sltmobitel.png"),
      Brand(
          id: uuid.v4(),
          name: "Lankabell",
          description: "Telecommunication services provider",
          logo: "/assets/images/brands/lankabell.png"),
      Brand(
          id: uuid.v4(),
          name: "Water Board",
          description: "Water supply and drainage board",
          logo: "/assets/images/brands/waterboard.png"),
      Brand(
          id: uuid.v4(),
          name: "Ceb",
          description: "Ceylon Electricity Board",
          logo: "/assets/images/brands/ceb.png"),
      Brand(
          id: uuid.v4(),
          name: "Dialog",
          description: "Leading mobile network operator",
          logo: "/assets/images/brands/dialog.png"),
      Brand(
          id: uuid.v4(),
          name: "Airtel",
          description: "Mobile network and internet service provider",
          logo: "/assets/images/brands/airtel.png"),
      Brand(
          id: uuid.v4(),
          name: "Hutch",
          description: "Mobile network operator",
          logo: "/assets/images/brands/hutch.png"),
    ]);
  }

  Brand getRandom() {
    final random = Random();
    return brands[random.nextInt(brands.length)];
  }
}
