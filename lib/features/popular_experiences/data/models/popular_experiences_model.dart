import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../../best_offers/data/models/address_model.dart';
import '../../../best_offers/data/models/images_model.dart';

part 'popular_experiences_model.g.dart';

part 'popular_experiences_model.freezed.dart';

@freezed
class PopularExperiences with _$PopularExperiences
{
  const factory PopularExperiences({
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
})=_PopularExperiences;

factory PopularExperiences.fromJson(Map<String, dynamic> json) =>
_$PopularExperiencesFromJson(json);
}