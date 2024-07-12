import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:money_wise/domain/transaction/transaction.dart';
part 'day_transactions.freezed.dart';

@freezed
abstract class DayTransactions with _$DayTransactions {
  const DayTransactions._();
  const factory DayTransactions({
    required DateTime date,
    required List<Transaction> transactions,
  }) = _DayTransactions;

  String get formattedDate => DateFormat('MMMM dd, yyyy').format(date);
}
