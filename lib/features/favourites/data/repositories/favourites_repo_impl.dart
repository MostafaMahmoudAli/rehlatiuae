import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/favourites/domain/repositories/favourites_repo.dart';

class FavouritesRepoImpl implements FavouritesRepo {
  final ApiConsumer apiConsumer;
  final CacheService cacheService;

  FavouritesRepoImpl({required this.apiConsumer, required this.cacheService});

  @override
  Future<Either<String, List<Trips>>> getFavourite() async {
    try {
      var response = await apiConsumer.get(EndPoints.favoriteTrip);
      List<Trips> trips = response['data']['trips']
          .map(
            (e) => Trips.fromJson(e),
          )
          .toList();
      return Right(trips);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
