import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_count.g.dart';

part 'review_count.freezed.dart';


@freezed
class ReviewCount with _$ReviewCount
{
  const factory ReviewCount({
  required  final int? oneStar,
  required  final int? towStar,
  required  final int? threeStar,
  required  final int? fourStar,
  required  final int? fiveStar,
})=_ReviewCount;

  factory ReviewCount.fromJson(Map<String, dynamic> json) =>
      _$ReviewCountFromJson(json);
}
