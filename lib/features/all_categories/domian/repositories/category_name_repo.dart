import 'package:dartz/dartz.dart';

import '../../../all_trips/data/models/trips_model.dart';

abstract class CategoryNameRepo {
  Future<Either<String, List<Trips>>> fetchCategoryNameTrips({
    int? startIndex = 0,
    int? limit = 10,
    int? clientId,
    required int categoryNameId,
  });
}
