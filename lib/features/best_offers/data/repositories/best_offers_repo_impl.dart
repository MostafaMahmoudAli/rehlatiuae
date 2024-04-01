import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../all_trips/data/models/trips_model.dart';
import '../../domain/repositories/best_offers_repo.dart';

class BestOffersRepoImpl implements BestOffersRepo {
  final ApiConsumer apiConsumer;

  BestOffersRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Trips>>> fetchBestOffers(
      {int? startIndex = 0, int? limit = 10}) async {
    try {
      var bestOffers =
          await apiConsumer.get(EndPoints.bestOffersEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      List<Trips> bestOffersList = bestOffers["data"]["bestOffers"]
          .map<Trips>((e) => Trips.fromJson(e))
          .toList();
      return right(bestOffersList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
