import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/our_blogs/data/models/blogs_model.dart';
import 'package:rehlatyuae/features/our_blogs/domain/repositories/blogs_repository.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';

class BlogsRepositoryImpl implements BlogsRepository {
  final ApiConsumer apiConsumer;

  BlogsRepositoryImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Blogs>>> fetchBlogs(
      {int? startIndex = 0, int? limit = 10}) async {
    try {
      var blogs = await apiConsumer.get(
        EndPoints.blogsEndPoint,
        queryParameters: {
          "start": startIndex,
          "limit": limit,
        },
      );
      List<Blogs> blogsList= [];
      final data =  blogs["data"]["blogs"]as dynamic;
      if(data.isNotEmpty)
      {
        blogsList=data.map<Blogs>((e) => Blogs.fromJson(e)).toList();
      }

      return right(blogsList);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, List<Blogs>>> fetchBlogsSearch({String? name}) async {
    try {
      var blogsTrip = await apiConsumer.get(
          EndPoints.blogSearchEndPoint,
          queryParameters: {
            "name":name,
          });
      List<Blogs> blogsTripList=[];
      final data = blogsTrip['data']["blogs"] as dynamic;
      if(data.isNotEmpty)
      {
        blogsTripList=data.map<Blogs>((e) => Blogs.fromJson(e)).toList();
      }
      return right(blogsTripList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}
