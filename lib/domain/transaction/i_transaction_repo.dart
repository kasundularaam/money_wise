import 'package:dartz/dartz.dart';
import 'package:money_wise/application/load_transactions/transactions_filter.dart';
import 'package:money_wise/domain/day_transactions/day_transactions.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/transaction/transaction.dart';

abstract class ITransactionRepo {
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, List<DayTransactions>>> getDayTransactions(
      {TransactionsFilter filter = TransactionsFilter.all});
}
