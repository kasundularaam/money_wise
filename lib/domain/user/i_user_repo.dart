import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/user/user.dart';

abstract class IUserRepo {
  Future<Either<Failure, List<User>>> getFavorites();
  Future<Either<Failure, Unit>> logIn(String pin);
  Stream<bool> get watchIsAuthenticated;
  User get currentUser;
  Future<void> signOut();
  void dispose();
}
