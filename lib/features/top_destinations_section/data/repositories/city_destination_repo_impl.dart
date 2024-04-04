import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import 'package:rehlatyuae/features/top_destinations_section/data/models/city_destination_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domian/repositories/city_destination_repo.dart';

class CityDestinationRepoImpl implements CityDestinationRepo {
 final ApiConsumer apiConsumer;
 CityDestinationRepoImpl({required this.apiConsumer,});
  @override
  Future<Either<String, CityDestination>> fetchCityDestinations({
    int? startIndex = 0,
    int? limit = 10,
    int? destinationId,
  })async {
    try {
      var cityDestinationData = await apiConsumer.get(
        EndPoints.cityDestinationEndPoint,
        queryParameters:{
          "destination_id":destinationId,
          "start":startIndex,
          "limit":limit,
        },
      );

      var cityDestinationModel = CityDestination.fromJson(cityDestinationData["data"]["trips"]);
      return right(cityDestinationModel);
    }on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}
