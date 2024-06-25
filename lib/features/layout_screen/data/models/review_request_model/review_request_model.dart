// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request_model.freezed.dart';
part 'review_request_model.g.dart';

@freezed
class ReviewRequest with _$ReviewRequest {
  const factory ReviewRequest({
    required final String name,
    required final String description,
    @JsonKey(name: "stars_numbers") required final int starsNumbers,
    @JsonKey(name: "image_path") required final String imagePath,
    @JsonKey(name: "trip_id") required final int tripId,
  }) = _ReviewRequest;

  factory ReviewRequest.fromJson(Map<String, dynamic> json) => _$ReviewRequestFromJson(json);
}
