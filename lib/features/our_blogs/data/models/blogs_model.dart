import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';

part 'blogs_model.freezed.dart';
part 'blogs_model.g.dart';

@freezed
class Blogs with _$Blogs
{
  const factory Blogs({
    final int? id,
    final String? name,
    final String? description,
    final String? imagePath,
    final List<Trips>? trips,
})= _Blogs;

  factory Blogs.fromJson(Map<String, dynamic> json) =>
      _$BlogsFromJson(json);
}