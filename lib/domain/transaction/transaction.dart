import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/domain/user/user.dart';
part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const Transaction._();
  const factory Transaction({
    required String id,
    required String title,
    required User sender,
    required Option<User> receiver,
    required Option<Brand> brand,
    required DateTime dateTime,
    required String amount,
  }) = _Transaction;

  String get date => DateFormat('MMMM dd, yyyy').format(dateTime);
  String get time => DateFormat('hh:mm a').format(dateTime);
}
