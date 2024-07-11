// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';

import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/transaction/i_transaction_repo.dart';
import 'package:money_wise/domain/transaction/transaction.dart';

part 'load_transactions_cubit.freezed.dart';
part 'load_transactions_state.dart';

@injectable
class LoadTransactionsCubit extends Cubit<LoadTransactionsState> {
  final ITransactionRepo _transactionRepo;
  LoadTransactionsCubit(
    this._transactionRepo,
  ) : super(const LoadTransactionsState.loading());

  Future<void> loadTransactions() async {
    emit(const LoadTransactionsState.loading());
    final failureOrTransactions = await _transactionRepo.getTransactions();
    if (failureOrTransactions.isLeft()) {
      emit(LoadTransactionsState.failed(failureOrTransactions.getLeft()));
      return;
    }
    emit(LoadTransactionsState.loaded(failureOrTransactions.getOrCrash()));
  }
}
