import 'package:dartz/dartz.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/transaction/transaction.dart';

abstract class ITransactionRepo {
  Future<Either<Failure, List<Transaction>>> getTransactions();
}
