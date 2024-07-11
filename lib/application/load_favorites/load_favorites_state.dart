part of 'load_favorites_cubit.dart';

@freezed
class LoadFavoritesState with _$LoadFavoritesState {
  const factory LoadFavoritesState.loading() = _Loading;
  const factory LoadFavoritesState.loaded(List<User> favorites) = _Loaded;
  const factory LoadFavoritesState.failed(Failure failure) = _Failed;
}
