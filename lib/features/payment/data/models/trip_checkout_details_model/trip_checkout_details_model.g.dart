// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_checkout_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripCheckoutDetailsImpl _$$TripCheckoutDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TripCheckoutDetailsImpl(
      tripId: json['trip_id'] as int,
      subtotalAdult: (json['subtotal_old'] as num).toDouble(),
      quantityAdult: json['quantity_old'] as int,
      subtotalChild: (json['subtotal_child'] as num).toDouble(),
      quantityChild: json['quantity_young'] as int,
      finalSubtotal: (json['final_subtotal'] as num).toDouble(),
      couponName: json['coupon_name'] as String,
      discount: (json['discount'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      date: json['date'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$TripCheckoutDetailsImplToJson(
        _$TripCheckoutDetailsImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'subtotal_old': instance.subtotalAdult,
      'quantity_old': instance.quantityAdult,
      'subtotal_child': instance.subtotalChild,
      'quantity_young': instance.quantityChild,
      'final_subtotal': instance.finalSubtotal,
      'coupon_name': instance.couponName,
      'discount': instance.discount,
      'total': instance.total,
      'date': instance.date,
      'description': instance.description,
    };
