import 'package:money_wise/domain/transaction/transaction.dart';

class Transactions {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(List<Transaction> transactions) {
    final orderedTransactions = _orderByDate(transactions);
    _transactions.addAll(orderedTransactions);
  }

  bool get isEmpty => _transactions.isEmpty;

  List<Transaction> _orderByDate(List<Transaction> transactions) {
    transactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    return transactions;
  }
}
