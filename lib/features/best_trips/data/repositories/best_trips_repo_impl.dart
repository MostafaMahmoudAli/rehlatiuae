import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../all_trips/data/models/trips_model.dart';
import '../../domian/repositories/best_trips_repo.dart';

class BestTripsRepoImpl implements BestTripsRepo {
  final ApiConsumer apiConsumer;

  BestTripsRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Trips>>> fetchBestTrips({
    int? startIndex = 0,
    int? limit = 10,
    int? clientId,
  }) async {
    try {
      var bestTrips = await apiConsumer.get(EndPoints.bestTripsEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
        "client_id": clientId,
      });
      List<Trips> bestTripsList = bestTrips["data"]["bestTrips"].map<Trips>((e) => Trips.fromJson(e)).toList();
      return right(bestTripsList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
