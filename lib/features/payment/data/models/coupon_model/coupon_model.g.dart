// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CouponImpl _$$CouponImplFromJson(Map<String, dynamic> json) => _$CouponImpl(
      id: json['id'] as int,
      couponName: json['coupon_name'] as String,
      couponAmount: json['coupon_amount'] as int,
      couponStart: json['coupon_start'] as String,
      couponEnd: json['coupon_end'] as String,
    );

Map<String, dynamic> _$$CouponImplToJson(_$CouponImpl instance) => <String, dynamic>{
      'id': instance.id,
      'coupon_name': instance.couponName,
      'coupon_amount': instance.couponAmount,
      'coupon_start': instance.couponStart,
      'coupon_end': instance.couponEnd,
    };
