// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';

import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/user/i_user_repo.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final IUserRepo _userRepo;
  LoginCubit(
    this._userRepo,
  ) : super(const LoginState.initial());

  Future<void> logIn(String pin) async {
    emit(const LoginState.loading());
    final failureOrUnit = await _userRepo.logIn(pin);
    if (failureOrUnit.isLeft()) {
      emit(LoginState.failed(failureOrUnit.getLeft()));
      return;
    }
    emit(const LoginState.succeed());
  }
}
