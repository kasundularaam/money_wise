import 'package:injectable/injectable.dart';
import 'package:money_wise/infrastructure/data/brands.dart';
import 'package:money_wise/infrastructure/data/users.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  Users get users => Users.init();

  @lazySingleton
  Brands get brands => Brands.init();
}
