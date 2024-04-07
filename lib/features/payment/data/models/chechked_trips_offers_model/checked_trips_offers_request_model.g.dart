// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checked_trips_offers_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckedTripsAndOffersRequestImpl _$$CheckedTripsAndOffersRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckedTripsAndOffersRequestImpl(
      couponName: json['couponName'] as String?,
      selectedData: (json['selectedData'] as List<dynamic>?)
          ?.map((e) => SelectedData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CheckedTripsAndOffersRequestImplToJson(
        _$CheckedTripsAndOffersRequestImpl instance) =>
    <String, dynamic>{
      'couponName': instance.couponName,
      'selectedData': instance.selectedData,
    };
