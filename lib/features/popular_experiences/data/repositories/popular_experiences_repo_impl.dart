import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../all_trips/data/models/trips_model.dart';
import '../../domain/repositories/popular_experiences_repo.dart';

class PopularExperiencesRepoImpl implements PopularExperiencesRepo {
  final ApiConsumer apiConsumer;

  PopularExperiencesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Trips>>> fetchPopularExperiences({
    int? startIndex = 0,
    int? limit = 10,
  }) async {
    try {
      var popularExperiences = await apiConsumer
          .get(EndPoints.popularExperiencesEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      List<Trips> popularExperiencesList =
          popularExperiences["data"]["popularExperiencetrips"]
              .map<Trips>((e) => Trips.fromJson(e))
              .toList();
      return right(popularExperiencesList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
