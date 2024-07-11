import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/user/i_user_repo.dart';
import 'package:money_wise/domain/user/user.dart';
import 'package:money_wise/infrastructure/data/users.dart';

@LazySingleton(as: IUserRepo)
class UserRepo implements IUserRepo {
  final Users _users;
  UserRepo(this._users);

  static const _pin = "1234";

  @override
  Future<Either<Failure, List<User>>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(_users.favorites);
  }

  @override
  Future<Either<Failure, User>> logIn(String pin) async {
    await Future.delayed(const Duration(seconds: 2));
    if (pin != _pin) {
      return left(const Failure("Invalid Pin. Please try again."));
    }
    return right(_users.currentUser);
  }
}
