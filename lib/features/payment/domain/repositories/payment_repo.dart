import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/payment/data/models/chechked_trips_offers_model/cart_trips.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';

import '../../data/models/chechked_trips_offers_model/check_trips_offers_response.dart';
import '../../data/models/chechked_trips_offers_model/checked_trips_offers_request_model.dart';

abstract class PaymentRepo {
  Future<Either<String, Coupon>> checkCoupon({required String name});

  Future<Either<String, String?>> makePayment({
    required int amount,
    required String currency,
  });

  Future<Either<String, Unit>> succeedCheckoutTrip({
    required String sessionId,
    required int checkoutId,
  });

  Future<Either<String, CheckTripsAndOffersResponse>> checkoutTripsAndOffers({
    required CheckedTripsAndOffersRequest checkModel,
  });

  Future<Either<String, List<CartTrips>>> getBooking();
}
