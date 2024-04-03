import 'package:dartz/dartz.dart';

import '../../data/search_model.dart';

abstract class SearchRepo
{
  Future<Either<String,List<SearchModel>>>fetchSearchData({String?name});
}