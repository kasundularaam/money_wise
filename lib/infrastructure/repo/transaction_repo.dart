import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:money_wise/domain/day_transactions/day_transactions.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/transaction/i_transaction_repo.dart';
import 'package:money_wise/domain/transaction/transaction.dart';
import 'package:money_wise/infrastructure/data/brands.dart';
import 'package:money_wise/infrastructure/data/users.dart';
import 'package:money_wise/infrastructure/services/core/utils.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: ITransactionRepo)
class TransactionRepo implements ITransactionRepo {
  final Users _users;
  final Brands _brands;

  TransactionRepo(this._users, this._brands);

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(
        List<Transaction>.generate(50, (index) => _generateTransaction()));
  }

  Transaction _generateTransaction() {
    final isPayBill = Random().nextBool();
    const uuid = Uuid();
    final dateTime = Utils.getRandomDate(30);

    if (isPayBill) {
      final brand = _brands.getRandom();
      return Transaction(
          id: uuid.v4(),
          title: "Payed bill at ${brand.name}",
          sender: _users.currentUser,
          receiver: const None(),
          brand: Some(brand),
          dateTime: dateTime,
          amount: (Random().nextInt(1000) + 1000).toString());
    }

    final isReceived = Random().nextBool();

    if (isReceived) {
      final sender = _users.getRandom();
      return Transaction(
          id: uuid.v4(),
          title: "Received money from ${sender.name}",
          sender: sender,
          receiver: Some(_users.currentUser),
          brand: const None(),
          dateTime: dateTime,
          amount: (Random().nextInt(100000) + 1000).toString());
    }

    final receiver = _users.getRandom();
    return Transaction(
        id: uuid.v4(),
        title: "Sent money to ${receiver.name}",
        sender: _users.currentUser,
        receiver: Some(receiver),
        brand: const None(),
        dateTime: dateTime,
        amount: (Random().nextInt(100000) + 1000).toString());
  }

  @override
  Future<Either<Failure, List<DayTransactions>>> getDayTransactions() async {
    await Future.delayed(const Duration(seconds: 2));
    final transactions =
        List<Transaction>.generate(50, (index) => _generateTransaction());
    final groupedTransactions = _convertToDayTransactions(transactions);
    return groupedTransactions;
  }

  Either<Failure, List<DayTransactions>> _convertToDayTransactions(
      List<Transaction> transactions) {
    try {
      Map<String, List<Transaction>> groupedTransactions = {};

      for (var transaction in transactions) {
        String dateKey = DateFormat('yyyy-MM-dd').format(transaction.dateTime);
        if (!groupedTransactions.containsKey(dateKey)) {
          groupedTransactions[dateKey] = [];
        }
        groupedTransactions[dateKey]!.add(transaction);
      }

      List<DayTransactions> dayTransactionsList = [];
      groupedTransactions.forEach((date, transactions) {
        DateTime parsedDate = DateTime.parse(date);
        dayTransactionsList
            .add(DayTransactions(date: parsedDate, transactions: transactions));
      });

      return right(dayTransactionsList);
    } catch (e) {
      return left(const Failure("Error converting transactions"));
    }
  }
}
