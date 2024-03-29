import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/features/all_categories/data/models/categories_model.dart';
import 'package:rehlatyuae/features/all_categories/domian/repositories/category_repo.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiConsumer apiConsumer;
  CategoryRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<Categories>>> fetchCategories({
    int? startIndex = 0,
    int? limit = 8,
  }) async{
    try {
      var categories = await apiConsumer.get(
          EndPoints.categoryEndPoint,
          queryParameters: {
        "start": startIndex,
        "limit": limit,
      });
      List<Categories> categoriesList = categories["data"]["categories"]
          .map<Categories>((e) => Categories.fromJson(e)).toList();
      return right(categoriesList);
    } on ServerExceptions catch (error)
    {
      return Left(error.errorModel.message);
    }
  }
}
