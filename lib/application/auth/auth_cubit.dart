// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';
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
  ) : super(const AuthState(
            isLoading: false, userOption: None(), failureOption: None()));

  Future<void> checkAuthStatus() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isLoading: false));
  }

  Future<void> logIn(String pin) async {
    emit(state.copyWith(isLoading: true, failureOption: const None()));
    final failureOrUser = await _userRepo.logIn(pin);
    if (failureOrUser.isLeft()) {
      emit(state.copyWith(
          isLoading: false, failureOption: Some(failureOrUser.getLeft())));
      return;
    }
    emit(state.copyWith(
        isLoading: false, userOption: Some(failureOrUser.getOrCrash())));
  }
}
