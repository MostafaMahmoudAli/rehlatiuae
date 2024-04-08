import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/core/errors/exceptions.dart';
import 'package:rehlatyuae/features/payment/data/models/coupon_model/coupon_model.dart';
import 'package:rehlatyuae/features/payment/data/models/trip_checkout_details_model/trip_checkout_details_model.dart';
import 'package:rehlatyuae/features/payment/domain/api_keys.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';

import '../models/chechked_trips_offers_model/check_trips_offers_response.dart';
import '../models/chechked_trips_offers_model/checked_trips_offers_request_model.dart';

class PaymentRepoImpl implements PaymentRepo {
  final ApiConsumer apiConsumer;

  PaymentRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, Coupon>> checkCoupon({required String name}) async {
    try {
      var response = await apiConsumer.get(
        EndPoints.checkCouponEndPoint,
        queryParameters: {'coupon_name': name},
      );
      Coupon coupon = Coupon.fromJson(response['data']['coupon']);
      return Right(coupon);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> addTripCheckoutDetails({
    required TripCheckoutDetails tripCheckoutDetails,
  }) async {
    try {
      await apiConsumer.post(
        EndPoints.addTripCheckoutDetailsEndPoint,
        data: tripCheckoutDetails.toJson(),
      );
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  @override
  Future<Either<String, Unit>> paymentMethod({
    required int amount,
    required String currency,
  }) async {
    try {
      String clientSecret = await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      return const Right(unit);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }

  Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "",
      ),
    );
  }

  Future<String> _getClientSecret(String amount, String currency) async {
    var response = await apiConsumer.post(
      EndPoints.stripePaymentEndPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${StripeApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );
    return response["client_secret"];
  }

  @override
  Future<Either<String, CheckTripsAndOffersResponse>> checkoutTripsAndOffers({
    required CheckedTripsAndOffersRequest checkModel,
  }) async {
    try {
      var response = await apiConsumer.post(
        EndPoints.checkedTripsAndOffersEndPoint,
        data: {
          'coupon_name': checkModel.couponName,
          'selectedData': checkModel.selectedData?.map((e) => e.toJson()).toList(),
        },
      );
      var checkedTripsAndOffers = CheckTripsAndOffersResponse.fromJson(response['data']["checkout"]);
      return Right(checkedTripsAndOffers);
    } on ServerExceptions catch (error) {
      return Left(error.errorModel.message);
    }
  }
}
