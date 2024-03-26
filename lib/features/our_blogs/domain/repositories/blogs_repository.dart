import 'package:dartz/dartz.dart';

import '../../data/models/blogs_model.dart';

abstract class BlogsRepository
{
  Future<Either<String,List<Blogs>>>fetchBestOffers({int?startIndex = 0 , int?limit = 10});
}