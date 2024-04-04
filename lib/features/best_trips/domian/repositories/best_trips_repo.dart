import 'package:dartz/dartz.dart';
import '../../../all_trips/data/models/trips_model.dart';

abstract class BestTripsRepo
{
  Future<Either<String, List<Trips>>> fetchBestTrips({
    int? startIndex = 0,
    int? limit = 10,
  });
}
