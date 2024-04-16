import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/all_trips/data/models/trips_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domian/repositories/category_name_repo.dart';

class CategoryNameRepoImpl implements CategoryNameRepo {
  final ApiConsumer apiConsumer;

  CategoryNameRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Trips>>> fetchCategoryNameTrips({
    int? startIndex = 0,
    int? limit = 10,
    int? clientId,
    required int categoryNameId,
  }) async {
    try {
      var trips = await apiConsumer.get(
        EndPoints.allTripEndPoint,
        queryParameters: {
          "category_id": categoryNameId,
          "client_id": clientId,
        },
      );
      List<Trips> tripsList = trips["data"]["trips"].map<Trips>((e) => Trips.fromJson(e)).toList();
      return right(tripsList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
