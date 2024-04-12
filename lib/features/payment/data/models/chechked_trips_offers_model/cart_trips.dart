import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../all_trips/data/models/trips_model.dart';

part 'cart_trips.freezed.dart';
part 'cart_trips.g.dart';

@freezed
class CartTrips with _$CartTrips {
  const factory CartTrips({
    required final int? id,
    required final int? checkoutId,
    required final String? date,
    required final String? status,
    required final int? quantityAdult,
    required final int? priceAdult,
    required final int? subtotalAdult,
    required final int? quantityChildren,
    required final int? priceChildren,
    required final int? subtotalChildren,
    required final int? total,
    required final Trips? trip,
  }) = _CartTrips;

  factory CartTrips.fromJson(Map<String, dynamic> json) => _$CartTripsFromJson(json);
}
