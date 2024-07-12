// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/application/load_transactions/transactions_filter.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
import 'package:money_wise/domain/day_transactions/day_transactions.dart';

import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/transaction/i_transaction_repo.dart';

part 'load_transactions_cubit.freezed.dart';
part 'load_transactions_state.dart';

@injectable
class LoadTransactionsCubit extends Cubit<LoadTransactionsState> {
  final ITransactionRepo _transactionRepo;
  LoadTransactionsCubit(
    this._transactionRepo,
  ) : super(const LoadTransactionsState.loading(TransactionsFilter.all));

  Future<void> loadTransactions(
      {TransactionsFilter filter = TransactionsFilter.all}) async {
    emit(LoadTransactionsState.loading(filter));
    final failureOrDayTransactions =
        await _transactionRepo.getDayTransactions();
    if (failureOrDayTransactions.isLeft()) {
      emit(LoadTransactionsState.failed(failureOrDayTransactions.getLeft()));
      return;
    }
    emit(LoadTransactionsState.loaded(
        filter, failureOrDayTransactions.getOrCrash()));
  }
}
