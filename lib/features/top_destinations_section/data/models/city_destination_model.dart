import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';

part 'city_destination_model.freezed.dart';
part 'city_destination_model.g.dart';

@freezed
class CityDestination with _$CityDestination
{
  const factory CityDestination({
  required  final int? id,
  required  final String? name,
  required  final String? description,
  required  final String? imagePath,
  required  final String? country,
  required  final List<Trips>? trips,
})=_CityDestination;

  factory CityDestination.fromJson(Map<String, dynamic> json) =>
      _$CityDestinationFromJson(json);
}