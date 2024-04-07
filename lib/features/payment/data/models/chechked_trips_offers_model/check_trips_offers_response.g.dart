// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_trips_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckTripsAndOffersResponseImpl _$$CheckTripsAndOffersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckTripsAndOffersResponseImpl(
      id: json['id'] as int?,
      status: json['status'] as String?,
      subtotal: json['subtotal'] as int?,
      couponName: json['couponName'] as String?,
      discount: json['discount'] as int?,
      total: json['total'] as int?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      cartTrip: json['cartTrip'] == null
          ? null
          : CartTrips.fromJson(json['cartTrip'] as Map<String, dynamic>),
      cartOffers: json['cartOffers'] as List<dynamic>?,
    );

Map<String, dynamic> _$$CheckTripsAndOffersResponseImplToJson(
        _$CheckTripsAndOffersResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'subtotal': instance.subtotal,
      'couponName': instance.couponName,
      'discount': instance.discount,
      'total': instance.total,
      'client': instance.client,
      'cartTrip': instance.cartTrip,
      'cartOffers': instance.cartOffers,
    };
