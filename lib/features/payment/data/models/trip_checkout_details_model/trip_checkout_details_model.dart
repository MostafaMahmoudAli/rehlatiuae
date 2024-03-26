// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_checkout_details_model.freezed.dart';
part 'trip_checkout_details_model.g.dart';

@freezed
class TripCheckoutDetails with _$TripCheckoutDetails {
  const factory TripCheckoutDetails({
    @JsonKey(name: "trip_id") required final int tripId,
    @JsonKey(name: "subtotal_old") required final double subtotalAdult,
    @JsonKey(name: "quantity_old") required final int quantityAdult,
    @JsonKey(name: "subtotal_child") required final double subtotalChild,
    @JsonKey(name: "quantity_young") required final int quantityChild,
    @JsonKey(name: "final_subtotal") required final double finalSubtotal,
    @JsonKey(name: "coupon_name") required final String couponName,
    @JsonKey(name: "discount") required final double discount,
    @JsonKey(name: "total") required final double total,
    @JsonKey(name: "date") required final String date,
    @JsonKey(name: "description") required final String description,
  }) = _TripCheckoutDetails;

  factory TripCheckoutDetails.fromJson(Map<String, dynamic> json) => _$TripCheckoutDetailsFromJson(json);
}
