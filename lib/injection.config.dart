// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:money_wise/application/auth/auth_cubit.dart' as _i14;
import 'package:money_wise/application/load_brands/load_brands_cubit.dart'
    as _i8;
import 'package:money_wise/application/load_favorites/load_favorites_cubit.dart'
    as _i15;
import 'package:money_wise/application/load_transactions/load_transactions_cubit.dart'
    as _i13;
import 'package:money_wise/application/login/login_cubit.dart' as _i16;
import 'package:money_wise/domain/brand/i_brand_rpo.dart' as _i6;
import 'package:money_wise/domain/transaction/i_transaction_repo.dart' as _i9;
import 'package:money_wise/domain/user/i_user_repo.dart' as _i11;
import 'package:money_wise/infrastructure/data/brands.dart' as _i4;
import 'package:money_wise/infrastructure/data/transactions.dart' as _i5;
import 'package:money_wise/infrastructure/data/users.dart' as _i3;
import 'package:money_wise/infrastructure/repo/brand_repo.dart' as _i7;
import 'package:money_wise/infrastructure/repo/transaction_repo.dart' as _i10;
import 'package:money_wise/infrastructure/repo/user_repo.dart' as _i12;
import 'package:money_wise/infrastructure/services/core/injectable_modules.dart'
    as _i17;

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
    gh.lazySingleton<_i5.Transactions>(() => injectableModules.transactions);
    gh.lazySingleton<_i6.IBrandRepo>(() => _i7.BrandRepo(gh<_i4.Brands>()));
    gh.factory<_i8.LoadBrandsCubit>(
        () => _i8.LoadBrandsCubit(gh<_i6.IBrandRepo>()));
    gh.lazySingleton<_i9.ITransactionRepo>(() => _i10.TransactionRepo(
          gh<_i3.Users>(),
          gh<_i4.Brands>(),
          gh<_i5.Transactions>(),
        ));
    gh.lazySingleton<_i11.IUserRepo>(() => _i12.UserRepo(gh<_i3.Users>()));
    gh.factory<_i13.LoadTransactionsCubit>(
        () => _i13.LoadTransactionsCubit(gh<_i9.ITransactionRepo>()));
    gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(gh<_i11.IUserRepo>()));
    gh.factory<_i15.LoadFavoritesCubit>(
        () => _i15.LoadFavoritesCubit(gh<_i11.IUserRepo>()));
    gh.factory<_i16.LoginCubit>(() => _i16.LoginCubit(gh<_i11.IUserRepo>()));
    return this;
  }
}

class _$InjectableModules extends _i17.InjectableModules {}
