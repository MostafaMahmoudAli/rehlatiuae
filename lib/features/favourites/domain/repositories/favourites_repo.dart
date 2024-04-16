import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';

abstract class FavouritesRepo {
  Future<Either<String, List<Trips>>> getFavouriteTrips({required int clientId});
}
