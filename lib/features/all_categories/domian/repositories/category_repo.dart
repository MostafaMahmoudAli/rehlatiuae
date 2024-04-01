import 'package:dartz/dartz.dart';

import '../../data/models/categories_model.dart';

abstract class CategoryRepo
{
  Future<Either<String,List<Categories>>>fetchCategories({int?startIndex = 0 , int?limit = 8});
}