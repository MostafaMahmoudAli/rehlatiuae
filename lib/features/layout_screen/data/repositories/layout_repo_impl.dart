import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import 'package:rehlatyuae/features/layout_screen/data/models/layout_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../all_categories/data/models/categories_model.dart';
import '../../../best_offers/data/models/best_offers_model.dart';
import '../../../best_trips/data/models/best_trips_model.dart';
import '../../../our_blogs/data/models/blogs_model.dart';
import '../../../popular_experiences/data/models/popular_experiences_model.dart';
import '../../../top_destinations_section/data/models/all_destination_model.dart';
import '../../domian/repositories/layout_repo.dart';
import '../models/our_partners_model.dart';
import '../models/review_model.dart';

class LayoutRepoImpl implements LayoutRepository
{
  final ApiConsumer apiConsumer;
  LayoutRepoImpl({required this.apiConsumer,});
  @override
  Future<Either<String, LayOutModel>> fetchLayoutData() async {
      try {
        var layoutData = await apiConsumer.get(
          EndPoints.layoutEndPoint,
        );
        // Parse each list in the layout data response to its corresponding model type
        var topDestinations = (layoutData['topDestinations'] as List)
            .map((item) => AllDestinations.fromJson(item))
            .toList();

        var categories = (layoutData['categories'] as List)
            .map((item) => Categories.fromJson(item))
            .toList();

        var bestOffers = (layoutData['bestOffers'] as List)
            .map((item) => BestOffers.fromJson(item))
            .toList();

        var bestTrips = (layoutData['bestTrips'] as List)
            .map((item) => BestTrips.fromJson(item))
            .toList();

        var popularExperience = (layoutData['popularExperience'] as List)
            .map((item) => PopularExperiences.fromJson(item))
            .toList();

        var blogs = (layoutData['blogs'] as List)
            .map((item) => Blogs.fromJson(item))
            .toList();

        var ourPartners = (layoutData['ourPartners'] as List)
            .map((item) => OurPartners.fromJson(item))
            .toList();

        var reviews = (layoutData['reviews'] as List)
            .map((item) => Review.fromJson(item))
            .toList();

        // Construct the LayOutModel object with the parsed lists
        var layoutModel = LayOutModel(
          topDestinations: topDestinations,
          categories: categories,
          bestOffers: bestOffers,
          bestTrips: bestTrips,
          popularExperience: popularExperience,
          blogs: blogs,
          ourPartners: ourPartners,
          reviews: reviews,
        );

        // Return the LayOutModel object wrapped in a Right constructor
        return right(layoutModel);
      }on ServerExceptions catch (error)
      {
        return Left(error.errorModel.message);
      }
    }
  }