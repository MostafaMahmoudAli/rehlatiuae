// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/all_trips/data/models/review_count.dart';

import '../../../all_trips/data/models/trips_model.dart';
import '../../../layout_screen/data/models/review_model.dart';

part 'blogs_model.freezed.dart';
part 'blogs_model.g.dart';

@freezed
class Blogs with _$Blogs {
  const factory Blogs({
    required final int? id,
    required final String? name,
    required final String? description,
    required final String? imagePath,
    @JsonKey(name: "created_at") required final DateTime? createdAt,
    final double? reviewAverage,
    final List<Review>? blogReview,
    required final Trips? trip,
    @JsonKey(name: "review_count") required final ReviewCount? reviewsCount,
  }) = _Blogs;

  factory Blogs.fromJson(Map<String, dynamic> json) => _$BlogsFromJson(json);
}
