import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/search/data/search_model.dart';
import 'package:rehlatyuae/features/search/domain/repositories/search_repo.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';

class SearchRepoImpl implements SearchRepo
{
  final ApiConsumer apiConsumer;
  SearchRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<SearchModel>>> fetchSearchData({String? name}) async {
    try {
      var searchTrip = await apiConsumer.get(
          EndPoints.searchTripEndPoint,
          queryParameters: {
           "name":name,
          });
      List<SearchModel> searchTripList= searchTrip["data"]
          .map<SearchModel>((e) => SearchModel.fromJson(e)).toList();
      return right(searchTripList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}