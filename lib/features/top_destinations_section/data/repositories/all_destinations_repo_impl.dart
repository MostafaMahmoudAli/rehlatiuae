import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';

import 'package:rehlatyuae/features/top_destinations_section/data/models/all_destination_model.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domian/repositories/all_destinations_repo.dart';

class AllDestinationsRepoImpl implements ALLDestinationsRepo
{
  final ApiConsumer apiConsumer;
  AllDestinationsRepoImpl({required this.apiConsumer,});
  @override
  Future<Either<String, List<AllDestinations>>> fetchAllDestinations({
    int? startIndex = 0,
    int? limit = 10,
  }) async{
    try {
      var allDestinations = await apiConsumer.get(
          EndPoints.allDestinationsEndPoint,
          queryParameters: {
            "start": startIndex,
            "limit": limit,
          });
      List<AllDestinations> allDestinationsList = allDestinations["data"]["topDestinations"]
          .map<AllDestinations>((e) => AllDestinations.fromJson(e)).toList();
      return right(allDestinationsList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}
