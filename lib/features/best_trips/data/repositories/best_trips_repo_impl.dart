import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import 'package:rehlatyuae/features/best_trips/data/models/best_trips_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domian/repositories/best_trips_repo.dart';

class BestTripsRepoImpl implements BestTripsRepo {
  final ApiConsumer apiConsumer;
  BestTripsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<BestTrips>>> fetchBestTrips({
    int? startIndex = 0,
    int? limit = 10,
  })async {
    try {
      var bestTrips = await apiConsumer.get(
          EndPoints.bestTripsEndPoint,
          queryParameters: {
            "start": startIndex,
            "limit": limit,
          });
      List<BestTrips> bestTripsList = bestTrips["data"]["bestTrips"]
          .map<BestTrips>((e) => BestTrips.fromJson(e)).toList();
      return right(bestTripsList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}
