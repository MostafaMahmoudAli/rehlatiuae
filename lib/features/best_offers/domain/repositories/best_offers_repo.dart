
import '../../../all_trips/data/models/trips_model.dart';
import 'package:dartz/dartz.dart';
abstract class BestOffersRepo
{
  Future<Either<String,List<Trips>>>fetchBestOffers({int?startIndex = 0 , int?limit = 10});
}