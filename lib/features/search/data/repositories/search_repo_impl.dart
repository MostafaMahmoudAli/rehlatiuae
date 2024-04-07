import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/search/domain/repositories/search_repo.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../all_trips/data/models/trips_model.dart';

class SearchRepoImpl implements SearchRepo
{
  final ApiConsumer apiConsumer;
  SearchRepoImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<Trips>>> fetchSearchData({String? name}) async {
    try {
      var searchTrip = await apiConsumer.get(
          EndPoints.searchTripEndPoint,
          queryParameters:  {
           "name":name,
          });

      List<Trips> searchTripList=[];
      final data = searchTrip['data'] as dynamic;
      if(data.isNotEmpty){
      searchTripList =  data["trips"]
            .map<Trips>((e) => Trips.fromJson(e)).toList();
      }

      return right(searchTripList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}