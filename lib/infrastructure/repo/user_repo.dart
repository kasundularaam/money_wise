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

  @override
  User get currentUser => _users.currentUser;

  @override
  Future<Either<Failure, List<User>>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(_users.favorites);
  }

  @override
  Future<Either<Failure, Unit>> logIn(String pin) => _users.login(pin);

  @override
  Stream<bool> get watchIsAuthenticated => _users.watchIsAuthenticated;

  @override
  void dispose() {
    _users.dispose();
  }
}
