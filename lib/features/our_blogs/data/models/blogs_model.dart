import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../all_trips/data/models/trips_model.dart';

part 'blogs_model.freezed.dart';

part 'blogs_model.g.dart';

@freezed
class Blogs with _$Blogs {
  const factory Blogs({
    required final int? id,
    required final String? name,
    required final String? description,
    required final String? imagePath,
    required final DateTime? createdAt,
    required final List<Trips>? trip,
  })= _Blogs;

  factory Blogs.fromJson(Map<String, dynamic> json) =>
      _$BlogsFromJson(json);
}