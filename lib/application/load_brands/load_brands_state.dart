part of 'load_brands_cubit.dart';

@freezed
class LoadBrandsState with _$LoadBrandsState {
  const factory LoadBrandsState.loading() = _Loading;
  const factory LoadBrandsState.loaded(List<Brand> brands) = _Loaded;
  const factory LoadBrandsState.failed(Failure failure) = _Failure;
}
