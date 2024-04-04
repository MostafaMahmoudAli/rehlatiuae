import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/trips_repository.dart';

class AllTripsRepoImpl implements AllTripsRepository {
  final ApiConsumer apiConsumer;
  AllTripsRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<Trips>>> fetchAllTrips({
    int? startIndex = 0,
    int? limit = 10,
  }) async {
    try {
      var trips =
      await apiConsumer.get(EndPoints.allTripEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      List<Trips> tripsList = trips["data"]["trips"]
          .map<Trips>((e) => Trips.fromJson(e))
          .toList();
      return right(tripsList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
