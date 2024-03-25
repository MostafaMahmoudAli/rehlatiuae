import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/best_offers/data/models/best_offers_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../domain/repositories/best_offers_repo.dart';

class BestOffersRepoImpl implements BestOffersRepo {
  final ApiConsumer apiConsumer;

  BestOffersRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<BestOffers>>> fetchBestOffers({int? startIndex = 0, int? limit = 10}) async {
    try {
      var bestOffers = await apiConsumer.get(EndPoints.bestOffersEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      final bestOffersList = bestOffers.map((e) => BestOffers.fromJson(e.data)).toList();
      return right(bestOffersList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
