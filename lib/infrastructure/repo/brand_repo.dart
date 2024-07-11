import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/domain/brand/i_brand_rpo.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/infrastructure/data/brands.dart';

@LazySingleton(as: IBrandRepo)
class BrandRepo implements IBrandRepo {
  final Brands _brands;

  BrandRepo(this._brands);
  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(_brands.brands);
  }
}
