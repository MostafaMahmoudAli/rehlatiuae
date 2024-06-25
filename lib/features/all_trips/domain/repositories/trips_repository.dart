import 'package:dartz/dartz.dart';

import '../../data/models/trips_model.dart';

abstract class AllTripsRepository {
  Future<Either<String, List<Trips>>> fetchAllTrips({
    int? startIndex = 0,
    int? limit = 10,
    int? clientId,
  });
}
