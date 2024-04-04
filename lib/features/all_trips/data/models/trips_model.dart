// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';

import '../../../best_offers/data/models/address_model.dart';
import '../../../best_offers/data/models/images_model.dart';

part 'trips_model.freezed.dart';
part 'trips_model.g.dart';

@freezed
class Trips with _$Trips {
  const factory Trips({
    required final int? id,
    required final String? name,
    required final String? address,
    required final String? description,
    @JsonKey(name: "oldPrice") required final int? adultPrice,
    required final int? childPrice,
    required final dynamic beforePrice,
    required final dynamic saving,
    required final String? imagePath,
    required final List<AddressModel>? addresses,
    required final List<ImagesModel>? images,
    required final bool? isFavourite,
    required final List<Trips>? offers,
    required final DateTime? createdAt,
    required final double? reviewAverage,
    required final List<Review>? reviews,
    @JsonKey(name: "review_count") required final ReviewCount? reviewsCount,
  }) = _Trips;

  factory Trips.fromJson(Map<String, dynamic> json) => _$TripsFromJson(json);
}
