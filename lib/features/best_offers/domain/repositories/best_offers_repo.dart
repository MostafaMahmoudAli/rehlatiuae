import 'package:dartz/dartz.dart';

import '../../../all_trips/data/models/trips_model.dart';

abstract class BestOffersRepo {
  Future<Either<String, List<Trips>>> fetchBestOffers({
    int? startIndex = 0,
    int? limit = 10,
    int? clientId,
  });
}
