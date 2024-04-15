import 'package:dartz/dartz.dart';

import '../../data/models/city_destination_model.dart';

abstract class CityDestinationRepo {
  Future<Either<String, CityDestination>> fetchCityDestinations({
    int? startIndex = 0,
    int? limit = 10,
    int? destinationId,
    int? clientId,
  });
}
