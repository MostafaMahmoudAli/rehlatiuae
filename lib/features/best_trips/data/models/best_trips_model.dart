import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../../best_offers/data/models/address_model.dart';
import '../../../best_offers/data/models/images_model.dart';

part 'best_trips_model.freezed.dart';
part 'best_trips_model.g.dart';

@freezed
class BestTrips with _$BestTrips
{
  const factory BestTrips({
    required final int id,
    required final String name,
    required final String address,
    required final String ?description,
    @JsonKey(name: "oldPrice")
    required final int ?adultPrice,
    required final int ?childPrice,
    required final String ?imagePath,
    required final List<AddressModel> ?addresses,
    required final List<ImagesModel>? images,
    required final bool? isFavourite,
    required final List<Trips>? offers,
})=_BestTrips;

  factory BestTrips.fromJson(Map<String, dynamic> json) =>
      _$BestTripsFromJson(json);
}
