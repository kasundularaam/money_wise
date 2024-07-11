import 'package:freezed_annotation/freezed_annotation.dart';
part 'brand.freezed.dart';

@freezed
abstract class Brand with _$Brand {
  const factory Brand({
    required String id,
    required String name,
    required String description,
    required String logo,
  }) = _Brand;
}
