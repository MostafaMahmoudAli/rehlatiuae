import 'package:dartz/dartz.dart';

import '../../data/models/popular_experiences_model.dart';

abstract class PopularExperiencesRepo{
  Future<Either<String, List<PopularExperiences>>> fetchPopularExperiences({
    int? startIndex = 0,
    int? limit = 10,
  });
}