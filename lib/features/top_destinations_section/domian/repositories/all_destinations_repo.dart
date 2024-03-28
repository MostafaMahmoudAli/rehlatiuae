import 'package:dartz/dartz.dart';

import '../../data/models/all_destination_model.dart';

abstract class ALLDestinationsRepo {
  Future<Either<String, List<AllDestinations>>> fetchAllDestinations({
    int? startIndex = 0,
    int? limit = 10,
  });
}
