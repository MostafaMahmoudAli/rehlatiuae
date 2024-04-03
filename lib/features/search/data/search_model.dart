import 'package:freezed_annotation/freezed_annotation.dart';

import '../../best_offers/data/models/address_model.dart';
import '../../best_offers/data/models/images_model.dart';

part 'search_model.g.dart';

part 'search_model.freezed.dart';

@freezed
class SearchModel with _$SearchModel {
  const factory SearchModel({
    required final int? id,
    required final String? name,
    required final String? address,
    required final String? description,
    @JsonKey(name: "oldPrice")
    required final int? adultPrice,
    required final int? childPrice,
    required final dynamic beforePrice,
    required final dynamic saving,
    final String? imagePath,
    required final List<AddressModel>? addresses,
    required final List<ImagesModel>? images,
  }) = _Search;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
