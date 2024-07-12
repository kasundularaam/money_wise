part of 'load_transactions_cubit.dart';

@freezed
class LoadTransactionsState with _$LoadTransactionsState {
  const factory LoadTransactionsState.loading(TransactionsFilter filter) =
      _Loading;
  const factory LoadTransactionsState.loaded(
          TransactionsFilter filter, List<DayTransactions> dayTransactions) =
      _Loaded;
  const factory LoadTransactionsState.failed(Failure failure) = _Failed;
}
