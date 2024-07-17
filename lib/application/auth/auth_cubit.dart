// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/domain/failure/failure.dart';

import 'package:money_wise/domain/user/i_user_repo.dart';
import 'package:money_wise/domain/user/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IUserRepo _userRepo;
  AuthCubit(
    this._userRepo,
  ) : super(
          const AuthState(
              isLoading: false,
              isAuthenticated: false,
              userOption: None(),
              failureOption: None(),
              greeting: "Good Morning!",
              totalBalance: "Rs.210,999.05"),
        );

  Future<void> checkAuthStatus() async {
    emit(state.copyWith(
        isLoading: true,
        failureOption: const None(),
        userOption: Some(_userRepo.currentUser)));
    await Future.delayed(const Duration(seconds: 2));
    _userRepo.watchIsAuthenticated.listen((isAuthenticated) {
      emit(state.copyWith(isAuthenticated: isAuthenticated, isLoading: false));
    });
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));
    await _userRepo.signOut();
  }

  @override
  Future<void> close() {
    _userRepo.dispose();
    return super.close();
  }
}
