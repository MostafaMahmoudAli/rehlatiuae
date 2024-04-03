import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';
import 'package:rehlatyuae/features/favourites/domain/repositories/favourites_repo.dart';

class FavouritesRepoImpl implements FavouritesRepo {
  final ApiConsumer apiConsumer;

  FavouritesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Trips>>> getFavouriteTrips() async {
    try {
      var response = await apiConsumer.get(EndPoints.myFavoriteTrip);
      List<Trips> trips = response['data']['trips']
          .map<Trips>(
            (e) => Trips.fromJson(e),
          )
          .toList();
      return Right(trips);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
