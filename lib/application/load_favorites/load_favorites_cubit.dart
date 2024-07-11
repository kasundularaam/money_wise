// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';

import 'package:money_wise/domain/failure/failure.dart';
import 'package:money_wise/domain/user/i_user_repo.dart';
import 'package:money_wise/domain/user/user.dart';

part 'load_favorites_cubit.freezed.dart';
part 'load_favorites_state.dart';

@injectable
class LoadFavoritesCubit extends Cubit<LoadFavoritesState> {
  final IUserRepo _userRepo;
  LoadFavoritesCubit(
    this._userRepo,
  ) : super(const LoadFavoritesState.loading());

  Future<void> loadFavorites() async {
    emit(const LoadFavoritesState.loading());
    final failureOrFavorites = await _userRepo.getFavorites();
    if (failureOrFavorites.isLeft()) {
      emit(LoadFavoritesState.failed(failureOrFavorites.getLeft()));
      return;
    }
    emit(LoadFavoritesState.loaded(failureOrFavorites.getOrCrash()));
  }
}
