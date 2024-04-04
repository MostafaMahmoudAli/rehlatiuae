// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_count.freezed.dart';
part 'review_count.g.dart';

@freezed
class ReviewCount with _$ReviewCount {
  const factory ReviewCount({
    @JsonKey(name: "one_star") required final int? oneStar,
    @JsonKey(name: "tow_star") required final int? towStar,
    @JsonKey(name: "three_star") required final int? threeStar,
    @JsonKey(name: "four_star") required final int? fourStar,
    @JsonKey(name: "five_star") required final int? fiveStar,
  }) = _ReviewCount;

  factory ReviewCount.fromJson(Map<String, dynamic> json) => _$ReviewCountFromJson(json);
}
