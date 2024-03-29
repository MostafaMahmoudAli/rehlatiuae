import 'package:dartz/dartz.dart';

import 'package:rehlatyuae/features/popular_experiences/data/models/popular_experiences_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/popular_experiences_repo.dart';

class PopularExperiencesRepoImpl implements PopularExperiencesRepo {
  final ApiConsumer apiConsumer;

  PopularExperiencesRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<PopularExperiences>>> fetchPopularExperiences({
    int? startIndex = 0,
    int? limit = 10,
  }) async {
    try {
      var popularExperiences = await apiConsumer
          .get(EndPoints.popularExperiencesEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      List<PopularExperiences> popularExperiencesList =
          popularExperiences["data"]["popularExperiencetrips"]
              .map<PopularExperiences>((e) => PopularExperiences.fromJson(e))
              .toList();
      return right(popularExperiencesList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
