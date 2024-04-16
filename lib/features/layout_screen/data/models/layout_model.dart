// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';

import '../../../all_categories/data/models/categories_model.dart';
import '../../../all_trips/data/models/trips_model.dart';
import '../../../our_blogs/data/models/blogs_model.dart';
import '../../../top_destinations_section/data/models/all_destination_model.dart';
import 'our_partners_model.dart';

part 'layout_model.freezed.dart';
part 'layout_model.g.dart';

@unfreezed
class LayOutModel with _$LayOutModel {
  factory LayOutModel({
    required final List<AllDestinations>? topDestinations,
    required final List<Categories>? categories,
    required List<Trips>? bestOffers,
    required List<Trips>? bestTrips,
    @JsonKey(name: "popularExperiencetrips") required List<Trips>? popularExperience,
    required final List<Blogs>? blogs,
    required final List<OurPartners>? ourPartners,
    required final List<Review>? reviews,
  }) = _LayOutModel;

  factory LayOutModel.fromJson(Map<String, dynamic> json) => _$LayOutModelFromJson(json);
}
