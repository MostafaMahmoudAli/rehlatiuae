import 'package:dartz/dartz.dart';

import '../../data/models/best_trips_model.dart';

abstract class BestTripsRepo
{
  Future<Either<String, List<BestTrips>>> fetchBestTrips({
    int? startIndex = 0,
    int? limit = 10,
  });
}
