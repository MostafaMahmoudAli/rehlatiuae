// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_trips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartTripsImpl _$$CartTripsImplFromJson(Map<String, dynamic> json) =>
    _$CartTripsImpl(
      id: json['id'] as int?,
      checkoutId: json['checkout_id'] as int?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      quantityAdult: json['quantityAdult'] as int?,
      priceAdult: json['priceAdult'] as int?,
      subtotalAdult: json['subtotalAdult'] as int?,
      quantityChildren: json['quantityChildren'] as int?,
      priceChildren: json['priceChildren'] as int?,
      subtotalChildren: json['subtotalChildren'] as int?,
      total: json['total'] as int?,
      trip: json['trip'] == null
          ? null
          : Trips.fromJson(json['trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartTripsImplToJson(_$CartTripsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'checkout_id': instance.checkoutId,
      'date': instance.date,
      'status': instance.status,
      'quantityAdult': instance.quantityAdult,
      'priceAdult': instance.priceAdult,
      'subtotalAdult': instance.subtotalAdult,
      'quantityChildren': instance.quantityChildren,
      'priceChildren': instance.priceChildren,
      'subtotalChildren': instance.subtotalChildren,
      'total': instance.total,
      'trip': instance.trip,
    };
