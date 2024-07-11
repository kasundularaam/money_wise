part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required bool isAuthenticated,
    required Option<User> userOption,
    required Option<Failure> failureOption,
    required String greeting,
    required String totalBalance,
  }) = _AuthState;
}
