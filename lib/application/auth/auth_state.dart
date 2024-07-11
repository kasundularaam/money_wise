part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required Option<User> userOption,
    required Option<Failure> failureOption,
  }) = _AuthState;
}
