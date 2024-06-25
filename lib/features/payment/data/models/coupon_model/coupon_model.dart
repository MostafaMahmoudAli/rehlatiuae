// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

@freezed
class Coupon with _$Coupon {
  const factory Coupon({
    required final int id,
    @JsonKey(name: "coupon_name") required final String couponName,
    @JsonKey(name: "coupon_amount") required final int couponAmount,
    @JsonKey(name: "coupon_start") required final String couponStart,
    @JsonKey(name: "coupon_end") required final String couponEnd,
  }) = _Coupon;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);
}
