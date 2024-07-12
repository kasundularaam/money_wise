// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money_wise/application/auth/auth_cubit.dart' as _i13;
import 'package:money_wise/application/load_brands/load_brands_cubit.dart'
    as _i7;
import 'package:money_wise/application/load_favorites/load_favorites_cubit.dart'
    as _i14;
import 'package:money_wise/application/load_transactions/load_transactions_cubit.dart'
    as _i12;
import 'package:money_wise/application/login/login_cubit.dart' as _i15;
import 'package:money_wise/domain/brand/i_brand_rpo.dart' as _i5;
import 'package:money_wise/domain/transaction/i_transaction_repo.dart' as _i8;
import 'package:money_wise/domain/user/i_user_repo.dart' as _i10;
import 'package:money_wise/infrastructure/data/brands.dart' as _i4;
import 'package:money_wise/infrastructure/data/users.dart' as _i3;
import 'package:money_wise/infrastructure/repo/brand_repo.dart' as _i6;
import 'package:money_wise/infrastructure/repo/transaction_repo.dart' as _i9;
import 'package:money_wise/infrastructure/repo/user_repo.dart' as _i11;
import 'package:money_wise/infrastructure/services/core/injectable_modules.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModules = _$InjectableModules();
    gh.lazySingleton<_i3.Users>(() => injectableModules.users);
    gh.lazySingleton<_i4.Brands>(() => injectableModules.brands);
    gh.lazySingleton<_i5.IBrandRepo>(() => _i6.BrandRepo(gh<_i4.Brands>()));
    gh.factory<_i7.LoadBrandsCubit>(
        () => _i7.LoadBrandsCubit(gh<_i5.IBrandRepo>()));
    gh.lazySingleton<_i8.ITransactionRepo>(() => _i9.TransactionRepo(
          gh<_i3.Users>(),
          gh<_i4.Brands>(),
        ));
    gh.lazySingleton<_i10.IUserRepo>(() => _i11.UserRepo(gh<_i3.Users>()));
    gh.factory<_i12.LoadTransactionsCubit>(
        () => _i12.LoadTransactionsCubit(gh<_i8.ITransactionRepo>()));
    gh.factory<_i13.AuthCubit>(() => _i13.AuthCubit(gh<_i10.IUserRepo>()));
    gh.factory<_i14.LoadFavoritesCubit>(
        () => _i14.LoadFavoritesCubit(gh<_i10.IUserRepo>()));
    gh.factory<_i15.LoginCubit>(() => _i15.LoginCubit(gh<_i10.IUserRepo>()));
    return this;
  }
}

class _$InjectableModules extends _i16.InjectableModules {}
