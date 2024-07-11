part of 'load_transactions_cubit.dart';

@freezed
class LoadTransactionsState with _$LoadTransactionsState {
  const factory LoadTransactionsState.loading() = _Loading;
  const factory LoadTransactionsState.loaded(List<Transaction> transactions) =
      _Loaded;
  const factory LoadTransactionsState.failed(Failure failure) = _Failed;
}
