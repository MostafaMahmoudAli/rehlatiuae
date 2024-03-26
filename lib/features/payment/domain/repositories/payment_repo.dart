import 'package:dartz/dartz.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';

abstract class PaymentRepo {
  Future<Either<String, Coupon>> checkCoupon({required String name});

  Future<Either<String, Unit>> addTripCheckoutDetails({required TripCheckoutDetails tripCheckoutDetails});
}
