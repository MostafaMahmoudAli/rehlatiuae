import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/layout_screen/data/models/review_model.dart';
import '../../../all_categories/data/models/categories_model.dart';
import '../../../best_offers/data/models/best_offers_model.dart';
import '../../../best_trips/data/models/best_trips_model.dart';
import '../../../our_blogs/data/models/blogs_model.dart';
import '../../../popular_experiences/data/models/popular_experiences_model.dart';
import '../../../top_destinations_section/data/models/all_destination_model.dart';
import 'our_partners_model.dart';
part 'layout_model.freezed.dart';
part 'layout_model.g.dart';

@freezed
class LayOutModel with _$LayOutModel
{
  const factory LayOutModel({
    required final List<AllDestinations>? topDestinations,
    required final List<Categories>? categories,
    required final List<BestOffers>? bestOffers,
    required final List<BestTrips>? bestTrips,
    required final List<PopularExperiences>? popularExperience,
    required final List<Blogs>? blogs,
    required final List<OurPartners>? ourPartners,
    required final List<Review>? reviews,
  }) = _LayOutModel;

  factory LayOutModel.fromJson(Map<String, dynamic> json) =>
      _$LayOutModelFromJson(json);
}
