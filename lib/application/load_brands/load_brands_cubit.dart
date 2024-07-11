// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_wise/core/extensions/dartz_x.dart';

import 'package:money_wise/domain/brand/brand.dart';
import 'package:money_wise/domain/brand/i_brand_rpo.dart';
import 'package:money_wise/domain/failure/failure.dart';

part 'load_brands_cubit.freezed.dart';
part 'load_brands_state.dart';

@injectable
class LoadBrandsCubit extends Cubit<LoadBrandsState> {
  final IBrandRepo _brandRepo;
  LoadBrandsCubit(
    this._brandRepo,
  ) : super(const LoadBrandsState.loading());

  Future<void> loadBrands() async {
    emit(const LoadBrandsState.loading());
    final failureOrBrands = await _brandRepo.getBrands();
    if (failureOrBrands.isLeft()) {
      emit(LoadBrandsState.failed(failureOrBrands.getLeft()));
      return;
    }
    emit(LoadBrandsState.loaded(failureOrBrands.getOrCrash()));
  }
}
