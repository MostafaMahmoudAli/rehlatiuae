import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';

import 'cart_trips.dart';

part 'check_trips_offers_response.g.dart';

part 'check_trips_offers_response.freezed.dart';

@freezed
class CheckTripsAndOffersResponse with _$CheckTripsAndOffersResponse
{
  const factory CheckTripsAndOffersResponse({
   required final  int? id,
   required final  String? status,
   required final  int? subtotal,
   required final  String? couponName,
   required final  int? discount,
   required final  int? total,
   required final  Client? client,
   required final  CartTrips? cartTrip,
   required final  List<dynamic>? cartOffers,
})=_CheckTripsAndOffersResponse;

  factory CheckTripsAndOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckTripsAndOffersResponseFromJson(json);
}