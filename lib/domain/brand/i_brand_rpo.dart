import 'package:dartz/dartz.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/domain/failure/failure.dart';

abstract class IBrandRepo {
  Future<Either<Failure, List<Brand>>> getBrands();
}
