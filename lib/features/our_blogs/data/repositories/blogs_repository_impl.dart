import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/our_blogs/data/models/blogs_model.dart';
import 'package:rehlatyuae/features/our_blogs/domain/repositories/blogs_repository.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';

class BlogsRepositoryImpl implements BlogsRepository
{
  final ApiConsumer apiConsumer;
  BlogsRepositoryImpl({required this.apiConsumer});
  @override
  Future<Either<String, List<Blogs>>> fetchBestOffers({int? startIndex = 0, int? limit = 10}) async {
    try {
      var blogs =
      await apiConsumer.get(EndPoints.blogsEndPoint, queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      final blogsList =
      blogs.map((e) => Blogs.fromJson(e.data)).toList();
      return right(blogsList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}