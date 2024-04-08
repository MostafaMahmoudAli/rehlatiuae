import 'package:dartz/dartz.dart';

import '../../../all_trips/data/models/trips_model.dart';

abstract class SearchRepo
{
  Future<Either<String,List<Trips>>>fetchSearchData({String?name});
}