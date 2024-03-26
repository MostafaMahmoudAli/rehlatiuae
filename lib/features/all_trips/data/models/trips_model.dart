import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../best_offers/data/models/address_model.dart';
import '../../../best_offers/data/models/images_model.dart';

part 'trips_model.g.dart';

part 'trips_model.freezed.dart';


@freezed
class Trips with _$Trips
{
  const factory Trips({
   required final int? id,
   required final String? name,
   required final String? address,
   required final String? description,
    @JsonKey(name: "oldPrice")
   required final int? adultPrice,
   required final int? childPrice,
   required final dynamic beforePrice,
   required final dynamic saving,
   required final String? imagePath,
   required final List<AddressModel>? addresses,
   required final List<ImagesModel>? images,
   required final bool? isFavourite,
   required final List<Trips>? offers,
})=_Trips;

  factory Trips.fromJson(Map<String, dynamic> json) =>
      _$TripsFromJson(json);
}
