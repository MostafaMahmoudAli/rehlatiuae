
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_model.g.dart';

part 'categories_model.freezed.dart';

@freezed
class Categories with _$Categories
{
  const factory Categories({
   required final int? id,
   required final String? name,
   required final String? description,
   required final String? imagePath,
})=_Categories;

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
